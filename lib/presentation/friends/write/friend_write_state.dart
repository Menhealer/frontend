import 'package:relog/core/utils/time_format.dart';

class FriendWriteState {
  final bool isLoading;
  final String? errorMessage;

  // mode
  final bool isEdit;

  final int? friendId;

  // form fields
  final String name;
  final String group;

  final bool birthdayEnabled;
  final int year;
  final int month;
  final int day;

  // original values (edit일 때 dirty 체크용)
  final String? originalName;
  final String? originalGroup;
  final String? originalBirthday;

  const FriendWriteState({
    required this.isLoading,
    required this.isEdit,
    this.friendId,
    required this.name,
    required this.group,
    required this.birthdayEnabled,
    required this.year,
    required this.month,
    required this.day,
    this.originalName,
    this.originalGroup,
    this.originalBirthday,
    this.errorMessage,
  });

  String? get birthdayYmd {
    if (!birthdayEnabled) return null;
    return formatIntBirthday(year, month, day);
  }

  String get trimmedName => name.trim();
  String get trimmedGroup => group.trim();

  bool get isNameValid => trimmedName.isNotEmpty;

  bool get isWriteValid => isNameValid;

  bool get isDirty {
    if (!isEdit) return true;

    final nameChanged = trimmedName != (originalName ?? '');
    final groupChanged =
        (trimmedGroup.isEmpty ? null : trimmedGroup) !=
            (originalGroup?.trim().isEmpty == true ? null : originalGroup);

    final birthdayChanged = birthdayYmd != originalBirthday;

    return nameChanged || groupChanged || birthdayChanged;
  }

  bool get canSubmit =>
      isEdit ? (isDirty && isNameValid) : isWriteValid;

  FriendWriteState copyWith({
    bool? isLoading,
    bool? isEdit,
    int? friendId,
    String? name,
    String? group,
    bool? birthdayEnabled,
    int? year,
    int? month,
    int? day,
    String? originalName,
    String? originalGroup,
    String? originalBirthday,
    String? errorMessage,
  }) {
    return FriendWriteState(
      isLoading: isLoading ?? this.isLoading,
      isEdit: isEdit ?? this.isEdit,
      friendId: friendId ?? this.friendId,
      name: name ?? this.name,
      group: group ?? this.group,
      birthdayEnabled: birthdayEnabled ?? this.birthdayEnabled,
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
      originalName: originalName ?? this.originalName,
      originalGroup: originalGroup ?? this.originalGroup,
      originalBirthday: originalBirthday ?? this.originalBirthday,
      errorMessage: errorMessage,
    );
  }
}
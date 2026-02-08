import 'package:relog/domain/gifts/enum/direction.dart';
import 'package:relog/domain/gifts/enum/gift_type.dart';
import 'package:relog/core/utils/time_format.dart';

class GiftWriteState {
  final bool isLoading;
  final String? errorMessage;

  // mode
  final bool isEdit;
  final int? giftId;

  // friend
  final int? friendId;
  final String friendName;

  // form
  final GiftType? giftType;
  final Direction? direction;
  final int? year;
  final int? month;
  final int? day;
  final int? price;
  final String description;

  // original (edit dirty check)
  final int? originalFriendId;
  final GiftType? originalGiftType;
  final Direction? originalDirection;
  final String? originalDate;
  final int? originalPrice;
  final String? originalDescription;

  const GiftWriteState({
    required this.isLoading,
    this.errorMessage,
    required this.isEdit,
    this.giftId,
    this.friendId,
    required this.friendName,
    this.giftType,
    this.direction,
    this.year,
    this.month,
    this.day,
    this.price,
    required this.description,
    this.originalFriendId,
    this.originalGiftType,
    this.originalDirection,
    this.originalDate,
    this.originalPrice,
    this.originalDescription,
  });

  // ===== getters =====

  bool get isDateValid => year != null && month != null && day != null;
  bool get isPriceValid => price != null;
  bool get isFriendValid => friendId != null;
  bool get isTagValid => giftType != null && direction != null;

  bool get canSubmit =>
      isFriendValid &&
          isTagValid &&
          isDateValid &&
          isPriceValid &&
          (isEdit ? isDirty : true);

  bool get isDirty {
    if (!isEdit) return true;

    return friendId != originalFriendId ||
        giftType != originalGiftType ||
        direction != originalDirection ||
        giftDateYmd != originalDate ||
        price != originalPrice ||
        description.trim() != (originalDescription ?? '').trim();
  }

  String? get giftDateYmd {
    if (!isDateValid) return null;
    return formatIntBirthday(year!, month!, day!);
  }

  GiftWriteState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isEdit,
    int? giftId,
    int? friendId,
    String? friendName,
    GiftType? giftType,
    Direction? direction,
    int? year,
    int? month,
    int? day,
    int? price,
    String? description,
    int? originalFriendId,
    GiftType? originalGiftType,
    Direction? originalDirection,
    String? originalDate,
    int? originalPrice,
    String? originalDescription,
  }) {
    return GiftWriteState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isEdit: isEdit ?? this.isEdit,
      giftId: giftId ?? this.giftId,
      friendId: friendId ?? this.friendId,
      friendName: friendName ?? this.friendName,
      giftType: giftType ?? this.giftType,
      direction: direction ?? this.direction,
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
      price: price ?? this.price,
      description: description ?? this.description,
      originalFriendId: originalFriendId ?? this.originalFriendId,
      originalGiftType: originalGiftType ?? this.originalGiftType,
      originalDirection: originalDirection ?? this.originalDirection,
      originalDate: originalDate ?? this.originalDate,
      originalPrice: originalPrice ?? this.originalPrice,
      originalDescription: originalDescription ?? this.originalDescription,
    );
  }
}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/domain/friends/model/friend_edit.dart';
import 'package:relog/domain/friends/model/friend_write_request.dart';
import 'package:relog/domain/friends/use_case/providers/friends_use_case_providers.dart';
import 'package:relog/domain/friends/use_case/write_friend_use_case.dart';
import 'package:relog/presentation/friends/write/friend_write_state.dart';

class FriendWriteViewModel extends Notifier<FriendWriteState> {
  late final WriteFriendUseCase _writeFriendUseCase;

  bool _initialized = false;

  @override
  FriendWriteState build() {
    _writeFriendUseCase = ref.read(writeFriendsUseCaseProvider);

    final now = DateTime.now();
    return FriendWriteState(
      isLoading: false,
      isEdit: false,
      name: '',
      group: '',
      birthdayEnabled: false,
      year: now.year,
      month: now.month,
      day: now.day,
    );
  }

  void initialize({
    required bool isEdit,
    FriendEdit? friend,
  }) {
    if (_initialized) return;
    _initialized = true;

    final now = DateTime.now();

    if (!isEdit || friend == null) {
      state = state.copyWith(isEdit: false);
      return;
    }

    final birthday = friend.birthday != null
        ? DateTime.tryParse(friend.birthday!)
        : null;

    state = state.copyWith(
      isEdit: true,
      name: friend.name,
      group: friend.group ?? '',
      birthdayEnabled: birthday != null,
      year: birthday?.year ?? now.year,
      month: birthday?.month ?? now.month,
      day: birthday?.day ?? now.day,
      originalName: friend.name,
      originalGroup: friend.group,
      originalBirthday: friend.birthday,
    );
  }

  void onNameChanged(String value) {
    state = state.copyWith(name: value);
  }

  void onGroupChanged(String value) {
    state = state.copyWith(group: value);
  }

  void onBirthdayPicked({
    required int year,
    required int month,
    required int day,
  }) {
    state = state.copyWith(
      birthdayEnabled: true,
      year: year,
      month: month,
      day: day,
    );
  }

  void disableBirthday() {
    state = state.copyWith(birthdayEnabled: false);
  }

  Future<bool> submit() async {
    if (!state.canSubmit) return false;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      if (state.isEdit) {
        // TODO: 친구 수정 use case
      } else {
        await _writeFriendUseCase.execute(
          FriendWriteRequest(
            name: state.trimmedName,
            group: state.trimmedGroup.isEmpty
                ? null
                : state.trimmedGroup,
            birthday: state.birthdayYmd,
          ),
        );
      }

      state = state.copyWith(isLoading: false);
      return true;
    } on ApiException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );
      return false;
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '친구 등록 중\n알 수 없는 오류가 발생했습니다.',
      );
      return false;
    }
  }
}
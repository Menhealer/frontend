import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/domain/friends/use_case/get_friend_detail_use_case.dart';
import 'package:relog/domain/friends/use_case/providers/friends_use_case_providers.dart';
import 'package:relog/presentation/friends/detail/friend_detail_state.dart';

class FriendDetailViewModel extends Notifier<FriendDetailState> {
  late final GetFriendDetailUseCase _getFriendDetailUseCase;

  int? _loadedFriendId;
  int? _loadingFriendId;

  @override
  FriendDetailState build() {
    _getFriendDetailUseCase = ref.read(getFriendDetailUseCaseProvider);
    return FriendDetailState(isLoading: false);
  }

  Future<void> loadFriend(int friendId, {bool force = false}) async {
    if (!force && _loadedFriendId == friendId && state.friendDetail != null) {
      return;
    }
    if (_loadingFriendId == friendId) {
      return;
    }
    _loadingFriendId = friendId;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final detail = await _getFriendDetailUseCase.execute(friendId);

      state = state.copyWith(
        isLoading: false,
        friendDetail: detail,
      );
      _loadedFriendId = friendId;
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "친구 정보를 불러오는 중\n알 수 없는 오류가 발생했습니다.",
      );
    } finally {
      if (_loadingFriendId == friendId) {
        _loadingFriendId = null;
      }
    }
  }

  void clearCache() {
    _loadedFriendId = null;
    _loadingFriendId = null;
  }
}
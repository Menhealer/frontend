import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/domain/friends/use_case/get_friends_use_case.dart';
import 'package:relog/domain/friends/use_case/providers/friends_use_case_providers.dart';
import 'package:relog/presentation/friends/friends_state.dart';

class FriendsViewModel extends Notifier<FriendsState> {
  late final GetFriendsUseCase _getFriendsUseCase;

  @override
  FriendsState build() {
    _getFriendsUseCase = ref.read(getFriendsUseCaseProvider);
    return FriendsState(isLoading: false);
  }
  Future<void> loadFriends() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final friends = await _getFriendsUseCase.execute();
      final next = _sortedFriends(friends);

      state = state.copyWith(isLoading: false, friends: next);
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "친구 목록을 불러오는 중\n알 수 없는 오류가 발생했습니다.",
      );
    }
  }

  void upsertFriend(Friend updated) {
    final list = state.friends;
    final idx = list.indexWhere((f) => f.id == updated.id);

    final next = [...list];
    if (idx == -1) {
      next.add(updated);
    } else {
      next[idx] = updated;
    }

    state = state.copyWith(friends: _sortedFriends(next));
  }

  void removeFriend(int friendId) {
    final next = state.friends.where((f) => f.id != friendId).toList();
    state = state.copyWith(friends: _sortedFriends(next));
  }

  List<Friend> _sortedFriends(List<Friend> list) {
    final next = [...list];
    next.sort(_compareFriendByNameAsc);
    return next;
  }

  int _compareFriendByNameAsc(Friend a, Friend b) {
    final an = a.name.trim();
    final bn = b.name.trim();

    final nameCmp = an.compareTo(bn);
    if (nameCmp != 0) return nameCmp;

    return a.id.compareTo(b.id);
  }
}
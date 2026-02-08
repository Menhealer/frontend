import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/domain/friends/use_case/friend_delete_use_case.dart';
import 'package:relog/domain/friends/use_case/get_friend_detail_use_case.dart';
import 'package:relog/domain/friends/use_case/providers/friends_use_case_providers.dart';
import 'package:relog/domain/gifts/model/gift.dart';
import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/presentation/friends/detail/friend_detail_state.dart';

class FriendDetailViewModel extends Notifier<FriendDetailState> {
  late final GetFriendDetailUseCase _getFriendDetailUseCase;
  late final FriendDeleteUseCase _friendDeleteUseCase;

  int? _loadedFriendId;
  int? _loadingFriendId;

  @override
  FriendDetailState build() {
    _getFriendDetailUseCase = ref.read(getFriendDetailUseCaseProvider);
    _friendDeleteUseCase = ref.read(friendDeleteUseCaseProvider);
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

  Future<bool> friendDelete(int friendId) async {
    try {
      return await _friendDeleteUseCase.execute(friendId);
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
      return false;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "친구 삭제 중\n알 수 없는 오류가 발생했습니다.",
      );
      return false;
    }
  }

  void replaceRecentGiftsFromGiftDetails(int friendId, List<GiftDetail> list) {
    final current = state.friendDetail;
    if (current == null) return;

    if (current.friend.id != friendId) return;

    final converted = list.where((g) => g.friendId == friendId).map((g) => Gift(
        giftId: g.id,
        price: g.price,
        giftDate: g.giftDate,
        giftType: g.giftType,
        direction: g.direction,
      )).toList();

    converted.sort((a, b) {
      final dateCmp = b.giftDate.compareTo(a.giftDate);
      if (dateCmp != 0) return dateCmp;
      return b.giftId.compareTo(a.giftId);
    });

    final top3 = converted.take(3).toList();

    state = state.copyWith(
      friendDetail: current.copyWith(
        giftHistory: top3,
      ),
    );
  }
}
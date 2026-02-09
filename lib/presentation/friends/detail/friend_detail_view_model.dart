import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/state/app_mutation_provider.dart';
import 'package:relog/domain/events/model/event.dart';
import 'package:relog/domain/events/model/event_detail.dart';
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

    ref.listen<AppMutation?>(appMutationProvider, (prev, next) {
      final fid = _loadedFriendId;
      final current = state.friendDetail;
      if (fid == null || current == null || next == null) return;

      if (next is EventUpserted) {
        final newFriendId = next.event.friendId;
        final oldFriendId = next.oldFriendId;

        if (fid == oldFriendId && fid != newFriendId) {
          removeEventFromLocal(next.event.id);
          return;
        }

        if (fid == newFriendId) {
          upsertEventToLocal(next.event);
          return;
        }
      }

      if (next is EventDeleted) {
        if (next.friendId == fid) {
          removeEventFromLocal(next.eventId);
        }
      }
    });

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
    if (state.isLoading) return false;

    try {
      final birthday = state.friend?.birthday;
      final ok = await _friendDeleteUseCase.execute(friendId);

      if (ok) {
        ref.read(appMutationProvider.notifier).emit(
          FriendDeleted(friendId: friendId, birthday: birthday),
        );
      }

      return ok;
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
      return false;
    } catch (_) {
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
        description: g.description,
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

  void removeEventFromLocal(int eventId) {
    final current = state.friendDetail;
    if (current == null) return;

    final list = current.recentEvents ?? const <Event>[];
    final next = list.where((e) => e.eventId != eventId).toList();

    state = state.copyWith(
      friendDetail: current.copyWith(recentEvents: next),
    );
  }

  void upsertEventToLocal(EventDetail updated) {
    final current = state.friendDetail;
    if (current == null) return;

    final mapped = _toFriendEvent(updated);

    final list = [...(current.recentEvents ?? const <Event>[])];
    final idx = list.indexWhere((e) => e.eventId == mapped.eventId);

    if (idx == -1) {
      list.insert(0, mapped);
    } else {
      list[idx] = mapped;
    }

    list.sort((a, b) {
      final dateCmp = b.eventDate.compareTo(a.eventDate);
      if (dateCmp != 0) return dateCmp;
      return b.eventId.compareTo(a.eventId);
    });

    final top3 = list.take(3).toList();

    state = state.copyWith(
      friendDetail: current.copyWith(recentEvents: top3),
    );
  }

  Event _toFriendEvent(EventDetail d) {
    return Event(
      eventId: d.id,
      title: d.title,
      eventDate: d.eventDate,
      reviewScore: d.reviewScore,
    );
  }
}
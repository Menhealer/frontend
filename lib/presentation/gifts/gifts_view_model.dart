import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/domain/gifts/use_case/get_gifts_use_case.dart';
import 'package:relog/domain/gifts/use_case/gift_delete_use_case.dart';
import 'package:relog/domain/gifts/use_case/providers/gift_use_case_providers.dart';
import 'package:relog/presentation/friends/providers/friends_view_providers.dart';
import 'package:relog/presentation/gifts/gifts_state.dart';

class GiftsViewModel extends Notifier<GiftsState> {
  late final GetGiftsUseCase _getGiftsUseCase;
  late final GiftDeleteUseCase _giftDeleteUseCase;

  @override
  GiftsState build() {
    _getGiftsUseCase = ref.read(getGiftsUseCaseProvider);
    _giftDeleteUseCase = ref.read(giftDeleteUseCaseProvider);
    return GiftsState(isLoading: false);
  }

  Future<void> loadGifts(int friendId) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final gifts = await _getGiftsUseCase.execute(friendId);
      final next = [...gifts]..sort(_compareGift);
      state = state.copyWith(isLoading: false, gifts: next, hasChanged: false, friendId: friendId);
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "선물 목록을 불러오는 중\n알 수 없는 오류가 발생했습니다.",
      );
    }
  }

  Future<bool> giftDelete(int giftId) async {
    if (state.isLoading) return false;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final ok = await _giftDeleteUseCase.execute(giftId);
      if (ok) {
        final next = state.gifts.where((g) => g.id != giftId).toList()
          ..sort(_compareGift);

        state = state.copyWith(
          isLoading: false,
          gifts: next,
          hasChanged: true,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
      return ok;
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
      return false;
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "선물 삭제 중\n알 수 없는 오류가 발생했습니다.",
      );
      return false;
    }
  }

  void upsertGift(GiftDetail updated) {
    final currentFriendId = state.friendId;
    if (currentFriendId == null) return;

    final next = [...state.gifts];

    if (updated.friendId != currentFriendId) {
      next.removeWhere((g) => g.id == updated.id);
      next.sort(_compareGift);
      state = state.copyWith(gifts: next, hasChanged: true);
      return;
    }

    final idx = next.indexWhere((g) => g.id == updated.id);
    if (idx == -1) {
      next.add(updated);
    } else {
      next[idx] = updated;
    }

    next.sort(_compareGift);
    state = state.copyWith(gifts: next, hasChanged: true);
  }

  List<GiftDetail> recent3() {
    final next = [...state.gifts]..sort(_compareGift);
    return next.take(3).toList();
  }

  void syncRecent3ToFriendDetail(int friendId, WidgetRef ref) {
    if (!state.hasChanged) return;

    final recent3Gift = recent3();
    ref.read(friendDetailViewModelProvider.notifier)
        .replaceRecentGiftsFromGiftDetails(friendId, recent3Gift);

    state = state.copyWith(hasChanged: false);
  }

  int _compareGift(GiftDetail a, GiftDetail b) {
    final dateCmp = b.giftDate.compareTo(a.giftDate);
    if (dateCmp != 0) return dateCmp;
    return b.id.compareTo(a.id);
  }
}
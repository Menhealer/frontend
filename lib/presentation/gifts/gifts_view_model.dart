import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/domain/gifts/use_case/get_gifts_use_case.dart';
import 'package:relog/domain/gifts/use_case/providers/gift_use_case_providers.dart';
import 'package:relog/presentation/gifts/gifts_state.dart';

class GiftsViewModel extends Notifier<GiftsState> {
  late final GetGiftsUseCase _getGiftsUseCase;

  @override
  GiftsState build() {
    _getGiftsUseCase = ref.read(getGiftsUseCaseProvider);
    return GiftsState(isLoading: false);
  }
  Future<void> loadGifts() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final gifts = await _getGiftsUseCase.execute();

      state = state.copyWith(isLoading: false, gifts: gifts);
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "선물 목록을 불러오는 중\n알 수 없는 오류가 발생했습니다.",
      );
    }
  }

  void upsertGift(GiftDetail updated) {
    final list = state.gifts;
    final next = [
      for (final g in list)
        if (g.id == updated.id) updated else g
    ];
    state = state.copyWith(gifts: next);
  }
}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/domain/home/use_case/get_monthly_use_case.dart';
import 'package:relog/domain/home/use_case/get_quarterly_use_case.dart';
import 'package:relog/domain/home/use_case/providers/home_use_case_providers.dart';
import 'package:relog/presentation/home/home_state.dart';

class HomeViewModel extends Notifier<HomeState> {
  late final GetMonthlyUseCase _getMonthlyUseCase;
  late final GetQuarterlyUseCase _getQuarterlyUseCase;

  @override
  HomeState build() {
    _getMonthlyUseCase = ref.read(getMonthlyUseCaseProvider);
    _getQuarterlyUseCase = ref.read(getQuarterlyUseCaseProvider);
    return HomeState(isLoading: false);
  }
  Future<void> loadAnalysis(int year, int month, int quarter) async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final monthly = await _getMonthlyUseCase.execute(year, month);
      final quarterly = await _getQuarterlyUseCase.execute(year, quarter);

      state = state.copyWith(isLoading: false, monthly: monthly, quarterly: quarterly);
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "분석 내용을 불러오는 중\n알 수 없는 오류가 발생했습니다.",
      );
    }
  }
}
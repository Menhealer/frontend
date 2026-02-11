import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/data/home/providers/home_repository_provider.dart';
import 'package:relog/domain/home/use_case/get_monthly_use_case.dart';
import 'package:relog/domain/home/use_case/get_quarterly_use_case.dart';

final getMonthlyUseCaseProvider = Provider<GetMonthlyUseCase>((ref) {
  final repo = ref.watch(homeRepositoryProvider);
  return GetMonthlyUseCase(repo);
});

final getQuarterlyUseCaseProvider = Provider<GetQuarterlyUseCase>((ref) {
  final repo = ref.watch(homeRepositoryProvider);
  return GetQuarterlyUseCase(repo);
});
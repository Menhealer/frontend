import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/data/gifts/providers/gifts_repository_provider.dart';
import 'package:relog/domain/gifts/use_case/get_gifts_use_case.dart';

final getGiftsUseCaseProvider = Provider<GetGiftsUseCase>((ref) {
  final repo = ref.watch(giftsRepositoryProvider);
  return GetGiftsUseCase(repo);
});
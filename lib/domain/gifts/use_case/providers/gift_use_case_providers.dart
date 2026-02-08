import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/data/gifts/providers/gifts_repository_provider.dart';
import 'package:relog/domain/gifts/use_case/get_gifts_use_case.dart';
import 'package:relog/domain/gifts/use_case/gift_delete_use_case.dart';
import 'package:relog/domain/gifts/use_case/gift_edit_use_case.dart';
import 'package:relog/domain/gifts/use_case/gift_write_use_case.dart';

final getGiftsUseCaseProvider = Provider<GetGiftsUseCase>((ref) {
  final repo = ref.watch(giftsRepositoryProvider);
  return GetGiftsUseCase(repo);
});

final giftWriteUseCaseProvider = Provider<GiftWriteUseCase>((ref) {
  final repo = ref.watch(giftsRepositoryProvider);
  return GiftWriteUseCase(repo);
});

final giftEditUseCaseProvider = Provider<GiftEditUseCase>((ref) {
  final repo = ref.watch(giftsRepositoryProvider);
  return GiftEditUseCase(repo);
});

final giftDeleteUseCaseProvider = Provider<GiftDeleteUseCase>((ref) {
  final repo = ref.watch(giftsRepositoryProvider);
  return GiftDeleteUseCase(repo);
});
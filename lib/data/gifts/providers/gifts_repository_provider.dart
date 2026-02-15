import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/network/dio/providers/dio_providers.dart';
import 'package:relog/data/gifts/repository/gifts_repository_impl.dart';
import 'package:relog/domain/gifts/repository/gifts_repository.dart';

final giftsRepositoryProvider = Provider<GiftsRepository>((ref) {
  final authDio = ref.watch(authDioProvider);

  return GiftsRepositoryImpl(authDio);
});
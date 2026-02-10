import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/network/providers/dio_provider.dart';
import 'package:relog/core/storage/providers/shared_preferences_provider.dart';
import 'package:relog/data/home/repository/home_repository_impl.dart';
import 'package:relog/domain/home/repository/home_repository.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final authDio = ref.watch(authDioProvider);
  final prefs = ref.watch(sharedPreferencesProvider);

  return HomeRepositoryImpl(authDio, prefs);
});
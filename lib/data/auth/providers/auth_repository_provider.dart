import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/network/dio/providers/dio_providers.dart';
import 'package:relog/data/auth/repository/auth_repository_impl.dart';
import 'package:relog/domain/auth/repository/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final plainDio = ref.watch(plainDioProvider);
  final authDio = ref.watch(authDioProvider);

  return AuthRepositoryImpl(plainDio, authDio);
});
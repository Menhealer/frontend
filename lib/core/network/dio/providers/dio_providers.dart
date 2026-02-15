import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/network/dio/dio_base.dart';
import 'package:relog/core/network/dio/interceptors/auth_interceptor.dart';
import 'package:relog/core/storage/providers/secure_storage_provider.dart';
import 'package:relog/core/storage/providers/user_session_provider.dart';

final plainDioProvider = Provider<Dio>((ref) {
  return buildBaseDio(ref);
});

final refreshDioProvider = Provider<Dio>((ref) {
  return buildBaseDio(ref);
});

// 토큰 필요 요청
final authDioProvider = Provider<Dio>((ref) {
  final dio = buildBaseDio(ref);

  dio.interceptors.add(
    AuthInterceptor(
      ref.watch(secureStorageProvider),
      ref.watch(refreshDioProvider),
      onUnauthorized: () => ref.read(userSessionProvider.notifier).clear(),
    ),
  );

  dio.interceptors.add(LogInterceptor(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    error: true,
  ));

  return dio;
});
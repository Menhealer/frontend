import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/network/auth_interceptor.dart';
import 'package:relog/core/network/response_interceptor.dart';
import 'package:relog/core/storage/providers/secure_storage_provider.dart';
import 'package:relog/core/storage/providers/user_session_provider.dart';

final baseDioOptionsProvider = Provider<BaseOptions>((ref) {
  final baseUrl = dotenv.get('BASE_URL');
  return BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
  );
});

final plainDioProvider = Provider<Dio>((ref) {
  final options = ref.watch(baseDioOptionsProvider);
  final dio = Dio(options);

  dio.interceptors.add(ResponseInterceptor());
  return dio;
});

final refreshDioProvider = Provider<Dio>((ref) {
  final options = ref.watch(baseDioOptionsProvider);
  final dio = Dio(options);

  dio.interceptors.add(ResponseInterceptor());
  return dio;
});

// 토큰 필요 요청
final authDioProvider = Provider<Dio>((ref) {
  final options = ref.watch(baseDioOptionsProvider);
  final dio = Dio(options);

  final secureStorage = ref.watch(secureStorageProvider);
  final refreshDio = ref.watch(refreshDioProvider);

  dio.interceptors.add(
    AuthInterceptor(
      secureStorage,
      refreshDio,
      onUnauthorized: () => ref.read(userSessionProvider.notifier).clear(),
    ),
  );

  dio.interceptors.add(ResponseInterceptor());
  // dio.interceptors.add(LogInterceptor(
  //   requestHeader: true,
  //   requestBody: true,
  //   responseBody: true,
  //   error: true,
  // ));
  return dio;
});
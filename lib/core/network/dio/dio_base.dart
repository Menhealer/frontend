import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:relog/core/network/dio/interceptors/app_check_interceptor.dart';
import 'package:relog/core/network/dio/interceptors/response_interceptor.dart';

final baseDioOptionsProvider = Provider<BaseOptions>((ref) {
  final baseUrl = dotenv.get('BASE_URL');
  return BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
  );
});

final firebaseAppCheckProvider = Provider<FirebaseAppCheck>((ref) {
  return FirebaseAppCheck.instance;
});

Dio buildBaseDio(Ref ref) {
  final dio = Dio(ref.watch(baseDioOptionsProvider));

  dio.interceptors.add(AppCheckInterceptor(ref.watch(firebaseAppCheckProvider)));
  dio.interceptors.add(ResponseInterceptor());

  return dio;
}
import 'package:dio/dio.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

class AppCheckInterceptor extends Interceptor {
  final FirebaseAppCheck _appCheck;

  AppCheckInterceptor(this._appCheck);

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
    ) async {
    try {
      final token = await _appCheck.getToken();

      if (token != null && token.isNotEmpty) {
        options.headers['X-Firebase-AppCheck'] = token;
      }
    } catch (_) {
      handler.reject(DioException(
        requestOptions: options,
        type: DioExceptionType.unknown,
        error: 'AppCheck token unavailable',
      ));
      return;
    }

    handler.next(options);
  }
}
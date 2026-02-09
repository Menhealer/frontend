import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/network/http_status_code.dart';
import 'package:relog/core/storage/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorageService storage;
  final Dio refreshDio;
  final Future<void> Function() onUnauthorized;

  AuthInterceptor(
    this.storage,
    this.refreshDio, {
    required this.onUnauthorized,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.read('accessToken');
    if (token != null) options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final status = err.response?.statusCode;
    if (status != HttpStatusCode.unauthorized.code) {
      handler.next(err);
      return;
    }

    Future<void> forceLogout([String? message]) async {
      await onUnauthorized();
      handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          type: DioExceptionType.badResponse,
          error: ApiException(
            message ?? '로그인이 만료됐어요',
            statusCode: HttpStatusCode.unauthorized.code,
          ),
        ),
      );
    }

    try {
      final refreshToken = await storage.read('refreshToken');
      if (refreshToken == null) {
        await forceLogout('로그인이 만료됐어요');
        return;
      }

      final endpoint = dotenv.get('REISSUE_ENDPOINT');

      Response refreshRes;
      try {
        final requestBody = {
          "refreshToken": refreshToken,
        };
        refreshRes = await refreshDio.post(endpoint, data: requestBody);
      } on DioException catch (e) {
        if (e.response?.statusCode == HttpStatusCode.unauthorized.code) {
          await forceLogout('로그인이 만료됐어요');
          return;
        }
        rethrow;
      }

      final newAccess = refreshRes.data['accessToken'].toString();
      final newRefresh = refreshRes.data['refreshToken'].toString();

      await storage.write('accessToken', newAccess);
      await storage.write('refreshToken', newRefresh);

      final req = err.requestOptions;
      req.headers['Authorization'] = 'Bearer $newAccess';

      final retryResponse = await refreshDio.fetch(req);
      handler.resolve(retryResponse);
    } catch (e) {
      await forceLogout('인증 갱신에 실패했어요');
    }
  }
}
import 'package:dio/dio.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/network/model/api_response.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final raw = response.data;

    if (raw is Map<String, dynamic> && raw.containsKey('success')) {
      final apiResponse = ApiResponse.fromJson(raw, (json) => json);

      if (apiResponse.success) {
        handler.next(response..data = apiResponse.data);
        return;
      }

      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: ApiException(apiResponse.message, statusCode: response.statusCode),
        ),
      );
      return;
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.error is ApiException) {
      handler.next(err);
      return;
    }

    final message = switch (err.type) {
      DioExceptionType.connectionTimeout => '연결 시간이 초과됐어요',
      DioExceptionType.receiveTimeout => '응답 시간이 지연되고 있어요',
      DioExceptionType.connectionError => '네트워크 연결을 확인해 주세요',
      DioExceptionType.cancel => '요청이 취소됐어요',
      _ => '알 수 없는 오류가 발생했어요',
    };

    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: ApiException(message, statusCode: err.response?.statusCode),
      ),
    );
  }
}
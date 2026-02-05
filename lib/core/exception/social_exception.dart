import 'package:flutter/services.dart';
import 'package:relog/core/exception/api_exception.dart';

bool isCanceledPlatformException(Object error) {
  return error is PlatformException && error.code == 'CANCELED';
}

bool isKakaoRateLimitError(Object error) {
  final s = error.toString().toLowerCase();
  return s.contains('invalid_request') &&
      s.contains('rate limit') &&
      s.contains('token');
}

class KakaoRateLimitException extends ApiException {
  const KakaoRateLimitException([
    super.message = "카카오 로그인 요청이 너무 자주 발생했습니다.\n잠시 후 다시 시도해 주세요."
  ]);

  @override
  String toString() => message;
}

class SocialException extends ApiException {
  const SocialException([
    super.message = "소셜 로그인 중 오류가 발생했습니다.\n잠시 후에 다시 시도해 주세요"
  ]);

  @override
  String toString() => message;
}
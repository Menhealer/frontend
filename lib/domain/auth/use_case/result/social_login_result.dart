import 'package:relog/domain/auth/enum/login_platform.dart';

sealed class SocialLoginResult {
  const SocialLoginResult();
}

class SocialLoginSuccess extends SocialLoginResult {
  const SocialLoginSuccess();
}

class SocialLoginNeedSignUp extends SocialLoginResult {
  final LoginPlatform platform;
  final String token;

  const SocialLoginNeedSignUp({
    required this.platform,
    required this.token,
  });
}

class SocialLoginCanceled extends SocialLoginResult {
  const SocialLoginCanceled();
}
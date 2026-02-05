import 'package:relog/domain/auth/enum/login_platform.dart';
import 'package:relog/domain/auth/repository/auth_repository.dart';

class SocialLoginUseCase {
  final AuthRepository _authRepository;
  SocialLoginUseCase(this._authRepository);

  Future<String?> execute(LoginPlatform platform) async {
    return switch (platform) {
      LoginPlatform.KAKAO => _authRepository.kakaoLogin(),
      LoginPlatform.APPLE => _authRepository.appleLogin(),
    };
  }
}
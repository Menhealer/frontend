enum LoginPlatform {
  KAKAO,
  APPLE;

  String get label => switch (this) {
    LoginPlatform.KAKAO => '카카오',
    LoginPlatform.APPLE => '애플',
  };
}

extension LoginPlatformParser on String {
  LoginPlatform toLoginPlatform() {
    switch (toLowerCase()) {
      case 'kakao':
        return LoginPlatform.KAKAO;
      case 'apple':
        return LoginPlatform.APPLE;
      default:
        throw Exception('Unknown login platform: $this');
    }
  }
}
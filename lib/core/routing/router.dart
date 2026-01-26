class SignUpException implements Exception {
  final String message;

  SignUpException([
    this.message = "입력 정보를 다시 확인해 주세요",
  ]);

  @override
  String toString() => message;
}

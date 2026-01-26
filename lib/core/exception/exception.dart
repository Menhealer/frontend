class InternalServerErrorException implements Exception {
  final String message;

  InternalServerErrorException([
    this.message = "알 수 없는 서버 에러가 발생했습니다.\n잠시 후에 다시 시도해 주세요.",
  ]);

  @override
  String toString() => message;
}
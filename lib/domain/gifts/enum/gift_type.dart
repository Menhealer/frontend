enum GiftType {
  BIRTHDAY,
  CONGRATULATORY,
  OTHER,
}

extension GiftTypeLabel on GiftType {
  String get label {
    switch (this) {
      case GiftType.BIRTHDAY:
        return '생일선물';
      case GiftType.CONGRATULATORY:
        return '경조사';
      case GiftType.OTHER:
        return '기타';
    }
  }
}
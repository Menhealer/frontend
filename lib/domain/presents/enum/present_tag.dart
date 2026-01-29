enum PresentTag {
  birthday,
  ceremony,
  etc,
}

extension PresentTagLabel on PresentTag {
  String get label {
    switch (this) {
      case PresentTag.birthday:
        return '생일선물';
      case PresentTag.ceremony:
        return '경조사';
      case PresentTag.etc:
        return '기타';
    }
  }
}

enum PresentDirection {
  sent,
  received,
}

extension PresentDirectionLabel on PresentDirection {
  String get label {
    switch (this) {
      case PresentDirection.sent:
        return '보낸 선물';
      case PresentDirection.received:
        return '받은 선물';
    }
  }
}
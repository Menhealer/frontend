enum Direction {
  GIVEN,
  RECEIVED,
}

extension DirectionLabel on Direction {
  String get label {
    switch (this) {
      case Direction.GIVEN:
        return '준 선물';
      case Direction.RECEIVED:
        return '받은 선물';
    }
  }
}

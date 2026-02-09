enum ReviewScore {
  VERY_BAD,
  BAD,
  NEUTRAL,
  GOOD,
  VERY_GOOD,
}

extension ReviewScoreX on ReviewScore {
  int get toInt {
    switch (this) {
      case ReviewScore.VERY_BAD:
        return 1;
      case ReviewScore.BAD:
        return 2;
      case ReviewScore.NEUTRAL:
        return 3;
      case ReviewScore.GOOD:
        return 4;
      case ReviewScore.VERY_GOOD:
        return 5;
    }
  }
}
import 'dart:ui';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/domain/events/enum/review_score.dart';

Color scoreToColor(int? score) {
  switch (score) {
    case 0:
      return ColorStyles.pointPink;
    case 1:
      return ColorStyles.red100;
    case 2:
      return ColorStyles.red10;
    case 3:
      return ColorStyles.gray86;
    case 4:
      return ColorStyles.green10;
    case 5:
      return ColorStyles.green100;
    default:
      return ColorStyles.gray86;
  }
}

int? scoreToInt(ReviewScore? s) {
  if (s == null) return null;
  switch (s) {
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

ReviewScore intToScore(int v) {
  if (v == 1) return ReviewScore.VERY_BAD;
  if (v == 2) return ReviewScore.BAD;
  if (v == 3) return ReviewScore.NEUTRAL;
  if (v == 4) return ReviewScore.GOOD;
  return ReviewScore.VERY_GOOD;
}
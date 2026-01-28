import 'dart:ui';
import 'package:relog/core/presentation/styles/color_styles.dart';

Color scoreToColor(int score) {
  switch (score) {
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
      return ColorStyles.black42;
  }
}
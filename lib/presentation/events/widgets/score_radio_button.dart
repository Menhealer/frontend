import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/utils/review_mapping.dart';

class ScoreRadioButton extends StatelessWidget {
  final int score;
  final bool isSelected;
  final VoidCallback onTap;
  final double size;

  const ScoreRadioButton({
    super.key,
    required this.score,
    required this.isSelected,
    required this.onTap,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    final color = scoreToColor(score);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? color
              : color.withValues(alpha: 0.5),
          border: isSelected
              ? Border.all(
            color: ColorStyles.white,
            width: 1,
          )
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          '$score',
          style: TextStyles.smallTextBold.copyWith(
            color: ColorStyles.black2D,
          ),
        ),
      ),
    );
  }
}
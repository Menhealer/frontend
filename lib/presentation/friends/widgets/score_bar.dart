import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';

class ScoreBar extends StatelessWidget {
  final int score;
  final double height;

  const ScoreBar({
    super.key,
    required this.score,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final clampedScore = score.clamp(-100, 100);
    final percent = clampedScore.abs() / 100;

    final barColor = clampedScore >= 0
        ? ColorStyles.green100
        : ColorStyles.red100;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;

          return Stack(
            children: [
              Container(
                height: height,
                width: maxWidth,
                color: ColorStyles.black42,
              ),
              Container(
                height: height,
                width: maxWidth * percent,
                color: barColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
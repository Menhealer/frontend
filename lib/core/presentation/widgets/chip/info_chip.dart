import 'package:flutter/material.dart';
import 'package:relog/core/presentation/ui/text_styles.dart';

class InfoChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const InfoChip({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(32),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: Text(
        label,
        style: TextStyles.smallTextBold.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
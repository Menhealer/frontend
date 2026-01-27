import 'package:flutter/material.dart';
import 'package:relog/core/presentation/ui/color_styles.dart';
import 'package:relog/core/presentation/ui/text_styles.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const SecondaryButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 40),
        decoration: BoxDecoration(
          color: ColorStyles.black42,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyles.smallTextBold.copyWith(
            color: ColorStyles.grayD3,
          ),
        ),
      ),
    );
  }
}
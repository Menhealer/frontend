import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyles.titleTextBold.copyWith(color: ColorStyles.white),
        ),
        const SizedBox(width: 16),
        Expanded(child: Divider(color: ColorStyles.black42)),
      ],
    );
  }
}
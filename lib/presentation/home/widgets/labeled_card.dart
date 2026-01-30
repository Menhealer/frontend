import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/presentation/home/widgets/text_card.dart';

class LabeledCard extends StatelessWidget {
  final String label;
  final String text;

  const LabeledCard({super.key,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.normalTextBold.copyWith(color: ColorStyles.grayD3),
        ),
        const SizedBox(height: 8),
        TextCard(text: text),
      ],
    );
  }
}
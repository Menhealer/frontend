import 'package:flutter/material.dart';
import 'package:relog/core/presentation/ui/color_styles.dart';
import 'package:relog/core/presentation/ui/text_styles.dart';

class SummarySection extends StatelessWidget {
  final String title;
  final String content;
  final bool scrollable;

  const SummarySection({
    super.key,
    required this.title,
    required this.content,
    this.scrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.normalTextBold.copyWith(
            color: ColorStyles.grayD3,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          constraints: const BoxConstraints(minHeight: 120),
          decoration: BoxDecoration(
            color: ColorStyles.black2D,
            borderRadius: BorderRadius.circular(8),
          ),
          child: scrollable
            ? SingleChildScrollView(
                child: Text(
                  content,
                  style: TextStyles.normalTextRegular.copyWith(
                    color: ColorStyles.grayD3,
                  ),
                ),
              )
            : Text(
                content,
                style: TextStyles.normalTextRegular.copyWith(
                  color: ColorStyles.grayD3,
                ),
              ),
        ),
      ],
    );
  }
}
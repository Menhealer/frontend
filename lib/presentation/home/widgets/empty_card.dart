import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

class EmptyCard extends StatelessWidget {
  final String message;
  const EmptyCard({super.key, this.message = '표시될 만큼 활동이 없어요'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxHeight: 160),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: ColorStyles.black2D,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        message,
        style: TextStyles.normalTextRegular.copyWith(
          color: ColorStyles.grayD3,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

class PickerField extends StatelessWidget {
  final String placeholder;
  final String? valueText;
  final VoidCallback onTap;

  const PickerField({
    super.key,
    required this.placeholder,
    required this.valueText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasValue = valueText != null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 44),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: ColorStyles.black2D,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          spacing: 16,
          children: [
            Expanded(
              child: Text(
                hasValue ? valueText! : placeholder,
                style: TextStyles.normalTextRegular.copyWith(
                  color: hasValue ? ColorStyles.white : ColorStyles.grayD3,
                ),
              ),
            ),
            Icon(
              Icons.navigate_next,
              color: ColorStyles.gray86,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:relog/core/presentation/ui/color_styles.dart';
import 'package:relog/core/presentation/ui/text_styles.dart';

class AppBarDoneButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback? onTap;

  const AppBarDoneButton({
    super.key,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onTap : null,
      style: TextButton.styleFrom(
        foregroundColor: enabled ? ColorStyles.grayD3 : ColorStyles.gray86,
        minimumSize: const Size(44, 44),
      ),
      child: Text(
        '완료',
        style: enabled ? TextStyles.normalTextBold : TextStyles.normalTextRegular,
      ),
    );
  }
}
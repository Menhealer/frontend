import 'package:flutter/material.dart';
import 'package:relog/core/presentation/ui/color_styles.dart';
import 'package:relog/core/presentation/ui/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final int maxLines;
  final bool enabled;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.maxLines = 1,
    this.enabled = true,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 44),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorStyles.black2D,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        maxLines: maxLines,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyles.normalTextRegular.copyWith(
          color: ColorStyles.white,
        ),
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyles.normalTextRegular.copyWith(
            color: ColorStyles.grayD3,
          ),
        ),
      ),
    );
  }
}
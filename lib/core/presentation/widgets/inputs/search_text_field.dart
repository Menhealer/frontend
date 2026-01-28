import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onSearchTap;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const SearchTextField({
    super.key,
    required this.controller,
    this.onSearchTap,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 44),
      padding: const EdgeInsets.only(left: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorStyles.black2D,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              maxLines: 1,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
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
              ),
            ),
          ),
          IconButton(
            onPressed: onSearchTap,
            icon: Icon(
              Icons.search,
              color: ColorStyles.gray86,
              size: 24,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
            visualDensity: VisualDensity.compact,
            highlightColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
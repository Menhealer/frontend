import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

class SelectableChipRow<T> extends StatelessWidget {
  final List<T> items;
  final T? selected;
  final String Function(T item) labelBuilder;
  final void Function(T item) onSelected;

  const SelectableChipRow({
    super.key,
    required this.items,
    required this.selected,
    required this.labelBuilder,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items.map((item) {
        final isSelected = item == selected;

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onSelected(item),
          child: Container(
            constraints: const BoxConstraints(minHeight: 34),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: ShapeDecoration(
              color: isSelected ? ColorStyles.grayA3 : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  width: 1,
                  color: isSelected
                    ? Colors.transparent
                    : ColorStyles.black42,
                ),
              ),
            ),
            child: Text(
              labelBuilder(item),
              style: isSelected
                ? TextStyles.normalTextBold.copyWith(
                    color: ColorStyles.black22,
                  )
                : TextStyles.normalTextRegular.copyWith(
                    color: ColorStyles.grayD3,
                  ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
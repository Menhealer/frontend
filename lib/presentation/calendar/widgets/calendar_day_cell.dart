import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

class CalendarDayCell extends StatelessWidget {
  final DateTime date;
  final bool inMonth;
  final bool selected;
  final List<Color> dots;
  final VoidCallback onTap;

  const CalendarDayCell({
    super.key,
    required this.date,
    required this.inMonth,
    required this.selected,
    required this.dots,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: selected ? ColorStyles.black2D : Colors.transparent,
          border: Border(top: BorderSide(color: ColorStyles.black2D)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            Text(
              '${date.day}',
              style: TextStyles.normalTextRegular.copyWith(
                color: inMonth ? ColorStyles.grayD3 : ColorStyles.gray86,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: dots.map((c) => Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: c, shape: BoxShape.circle),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/domain/calendar.dart';
import 'package:relog/presentation/calendar/widgets/calendar_day_cell.dart';

class MonthGrid extends StatelessWidget {
  final DateTime month; // 해당 월의 1일
  final DateTime selected;
  final ValueChanged<DateTime> onSelect;
  final List<Calendar> Function(DateTime date) eventLookup;
  final double cellHeight;

  const MonthGrid({super.key,
    required this.month,
    required this.selected,
    required this.onSelect,
    required this.eventLookup,
    required this.cellHeight,
  });

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(month.year, month.month, 1);

    // 일요일 시작: Sun=0, Mon=1 ... Sat=6
    final leading = firstDay.weekday % 7;

    // 그 달의 마지막 날짜
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;

    // 필요한 주 수
    final totalCells = leading + daysInMonth;
    final weeks = (totalCells / 7).ceil();
    final itemCount = weeks * 7;

    // 그리드가 시작되는 날짜(앞쪽 빈칸 포함)
    final gridStart = firstDay.subtract(Duration(days: leading));

    DateTime dateAt(int index) => DateTime(gridStart.year, gridStart.month, gridStart.day + index);

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisExtent: cellHeight,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final d = dateAt(index);
        final inMonth = d.month == month.month;
        final isSelected = DateUtils.isSameDay(d, selected);

        final events = eventLookup(DateTime(d.year, d.month, d.day));

        final hasEvent = events.any((e) => e.category == 'event');
        final hasBirthday = events.any((e) => e.category == 'birthday');

        final dots = <Color>[
          if (hasEvent) ColorStyles.pointPurple,
          if (hasBirthday) ColorStyles.pointPink,
        ];

        return CalendarDayCell(
          date: d,
          inMonth: inMonth,
          selected: isSelected,
          dots: dots,
          onTap: () => onSelect(DateTime(d.year, d.month, d.day)),
        );
      },
    );
  }
}
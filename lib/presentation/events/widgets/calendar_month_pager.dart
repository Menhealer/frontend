import 'package:flutter/material.dart';
import 'package:relog/presentation/events/model/calendar_item.dart';
import 'package:relog/presentation/events/utils/calendar_month_calc.dart';
import 'package:relog/presentation/events/widgets/month_grid.dart';

class CalendarMonthPager extends StatelessWidget {
  final PageController controller;
  final int basePage;
  final DateTime anchorMonth; // 1일로 맞춘 값
  final DateTime selectedDate;
  final double cellHeight;

  final ValueChanged<DateTime> onMonthChanged; // 월이 바뀌었을 때
  final ValueChanged<DateTime> onDateSelected; // 날짜를 선택했을 때

  final List<CalendarItem> Function(DateTime date) eventLookup;

  const CalendarMonthPager({
    super.key,
    required this.controller,
    required this.basePage,
    required this.anchorMonth,
    required this.selectedDate,
    required this.cellHeight,
    required this.onMonthChanged,
    required this.onDateSelected,
    required this.eventLookup,
  });

  DateTime monthForPage(int page) => CalendarMonthCalc.addMonths(anchorMonth, page - basePage);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      onPageChanged: (page) {
        final m = monthForPage(page);
        onMonthChanged(m); // 부모가 focusedMonth, selectedDate 동기화 결정
      },
      itemBuilder: (context, pageIndex) {
        final month = monthForPage(pageIndex);
        return MonthGrid(
          month: month,
          selected: selectedDate,
          cellHeight: cellHeight,
          eventLookup: eventLookup,
          onSelect: onDateSelected,
        );
      },
    );
  }
}
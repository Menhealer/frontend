import 'package:flutter/foundation.dart';

@immutable
class MonthGridMetrics {
  final DateTime monthStart;   // 해당 월의 1일
  final DateTime gridStart;    // 그리드 시작 날짜(leading 포함)
  final int leading;           // 앞쪽 빈칸 수 (일요일 시작 기준)
  final int daysInMonth;       // 해당 월 일수
  final int weeks;             // 4~6
  final int itemCount;         // weeks * 7

  const MonthGridMetrics({
    required this.monthStart,
    required this.gridStart,
    required this.leading,
    required this.daysInMonth,
    required this.weeks,
    required this.itemCount,
  });

  DateTime dateAt(int index) => DateTime(gridStart.year, gridStart.month, gridStart.day + index);

  bool isInMonth(DateTime d) => d.month == monthStart.month && d.year == monthStart.year;
}

class CalendarMonthCalc {
  // month는 아무 DateTime이 와도 되지만, 내부에서 monthStart(1일)로 맞춰서 계산함
  static MonthGridMetrics metrics(DateTime month) {
    final monthStart = DateTime(month.year, month.month, 1);

    final leading = monthStart.weekday % 7;

    final daysInMonth = DateTime(monthStart.year, monthStart.month + 1, 0).day;

    final totalCells = leading + daysInMonth;
    final weeks = (totalCells / 7).ceil();
    final itemCount = weeks * 7;

    final gridStart = monthStart.subtract(Duration(days: leading));

    return MonthGridMetrics(
      monthStart: monthStart,
      gridStart: gridStart,
      leading: leading,
      daysInMonth: daysInMonth,
      weeks: weeks,
      itemCount: itemCount,
    );
  }

  // anchorMonth 기준으로 month를 더하는 함수
  static DateTime addMonths(DateTime baseMonthStart, int deltaMonths) {
    return DateTime(baseMonthStart.year, baseMonthStart.month + deltaMonths, 1);
  }

  // anchorMonth에서 targetMonth까지의 개월 차이
  static int diffMonths(DateTime anchorMonthStart, DateTime targetMonthStart) {
    return (targetMonthStart.year - anchorMonthStart.year) * 12 +
        (targetMonthStart.month - anchorMonthStart.month);
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/picker/calendar_picker.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/calendar.dart';
import 'package:relog/presentation/calendar/utils/calendar_month_calc.dart';
import 'package:relog/presentation/calendar/widgets/calendar_month_pager.dart';
import 'package:relog/presentation/calendar/widgets/selected_day_event_list.dart';
import 'calendar_dummy.dart';

class CalendarScreen extends HookConsumerWidget {
  final void Function(bool isEdit, DateTime date) onTapWrite;
  final void Function(int id) onTapPresent;
  final void Function(int id) onTapEventDetail;

  const CalendarScreen({
    super.key,
    required this.onTapWrite,
    required this.onTapPresent,
    required this.onTapEventDetail,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();

    // PageView로 월 스와이프
    final basePage = 1200;
    final pageController = usePageController(initialPage: basePage);
    final isProgrammaticJump = useRef(false);

    // dispose 전까지 캐싱
    final anchorMonth = useMemoized(() => DateTime(now.year, now.month, 1));

    final focusedMonth = useState<DateTime>(DateTime(now.year, now.month, 1));
    final selectedDate = useState<DateTime>(DateTime(now.year, now.month, now.day));

    int pageForMonth(DateTime targetMonth) {
      final target = DateTime(targetMonth.year, targetMonth.month, 1);
      final diff = CalendarMonthCalc.diffMonths(anchorMonth, target);
      return basePage + diff;
    }

    void onMonthChanged(DateTime month) {
      final m = DateTime(month.year, month.month, 1);
      focusedMonth.value = m;

      if (isProgrammaticJump.value) {
        isProgrammaticJump.value = false;
        return;
      }
      selectedDate.value = m;
    }

    // 선택한 날짜의 월이 다르면 이동
    Future<void> onDateSelected(DateTime d) async {
      final picked = DateTime(d.year, d.month, d.day);

      final currentMonth = DateTime(focusedMonth.value.year, focusedMonth.value.month, 1);
      final pickedMonth = DateTime(picked.year, picked.month, 1);

      selectedDate.value = picked;

      if (pickedMonth != currentMonth) {
        focusedMonth.value = pickedMonth;

        final targetPage = pageForMonth(pickedMonth);

        isProgrammaticJump.value = true;

        await pageController.animateToPage(
          targetPage,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    }

    // 연/월 picker call back
    final openYearMonthPicker = useCallback(() async {
      final result = await showYearMonthPicker(
        context,
        initialYear: focusedMonth.value.year,
        initialMonth: focusedMonth.value.month,
        minYear: 2000,
        maxYear: 2035,
      );
      if (result == null) return;

      final target = DateTime(result.year, result.month, 1);
      final targetPage = pageForMonth(target);

      pageController.animateToPage(
        targetPage,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );

      focusedMonth.value = target;
      selectedDate.value = target;
    }, [context, focusedMonth.value, pageController, anchorMonth,]);

    // 선택된 날짜의 이벤트
    final eventsForSelected = calendarDummy[ymdKey(selectedDate.value)] ?? const <Calendar>[];

    // 달력 높이 계산
    const cellHeight = 64.0; // 한 날짜 칸 높이
    final weeks = CalendarMonthCalc.metrics(focusedMonth.value).weeks;
    final calendarHeight = weeks * cellHeight;

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _CalendarHeader(
                  month: focusedMonth.value,
                  onTapMonth: openYearMonthPicker,
                  onTapWrite: () => onTapWrite(false, selectedDate.value),
                ),
              ),
              const SizedBox(height: 16),

              // 요일
              const _WeekdayRow(),
              const SizedBox(height: 8),

              // 달력
              SizedBox(
                height: calendarHeight,
                child: CalendarMonthPager(
                  controller: pageController,
                  basePage: basePage,
                  anchorMonth: anchorMonth,
                  selectedDate: selectedDate.value,
                  cellHeight: cellHeight,
                  onMonthChanged: onMonthChanged,
                  onDateSelected: onDateSelected,
                  eventLookup: (d) => calendarDummy[ymdKey(d)] ?? const <Calendar>[],
                ),
              ),

              // 일정 목록
              Expanded(
                child: SelectedDayEventList(
                  onTapPresent: onTapPresent,
                  onTapEventDetail: onTapEventDetail,
                  events: eventsForSelected,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  final DateTime month;
  final VoidCallback onTapMonth;
  final VoidCallback onTapWrite;

  const _CalendarHeader({
    required this.month,
    required this.onTapMonth,
    required this.onTapWrite,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTapMonth,
            child: Row(
              spacing: 8,
              children: [
                Text(
                  '${month.year}년 ${month.month}월',
                  style: TextStyles.largeTextBold.copyWith(
                    color: ColorStyles.grayD3,
                  ),
                ),
                Icon(Icons.navigate_next, color: ColorStyles.grayD3),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: onTapWrite,
          icon: Icon(Icons.add, color: ColorStyles.grayD3, size: 24),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
          visualDensity: VisualDensity.compact,
          highlightColor: Colors.transparent,
        ),
      ],
    );
  }
}

class _WeekdayRow extends StatelessWidget {
  const _WeekdayRow();

  @override
  Widget build(BuildContext context) {
    const labels = ['일', '월', '화', '수', '목', '금', '토'];
    return Row(
      children: List.generate(7, (i) {
        return Expanded(
          child: Center(
            child: Text(
              labels[i],
              style: TextStyles.smallTextRegular.copyWith(
                color: ColorStyles.gray86,
              ),
            ),
          ),
        );
      }),
    );
  }
}
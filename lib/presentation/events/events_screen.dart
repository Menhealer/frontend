import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/presentation/widgets/picker/calendar_picker.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/events/model/event_detail.dart';
import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/presentation/events/model/calendar_item.dart';
import 'package:relog/presentation/events/providers/events_view_providers.dart';
import 'package:relog/presentation/events/utils/calendar_month_calc.dart';
import 'package:relog/presentation/events/widgets/calendar_month_pager.dart';
import 'package:relog/presentation/events/widgets/selected_day_event_list.dart';

class EventsScreen extends HookConsumerWidget {
  final Future<EventDetail?> Function(bool isEdit, DateTime date) onTapWrite;
  final void Function(Friend friend) onTapGift;
  final void Function(int id) onTapEventDetail;

  const EventsScreen({
    super.key,
    required this.onTapWrite,
    required this.onTapGift,
    required this.onTapEventDetail,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(eventsViewModelProvider);
    final vm = ref.read(eventsViewModelProvider.notifier);

    final now = DateTime.now();

    // PageView로 월 스와이프
    final basePage = 1200;
    final pageController = usePageController(initialPage: basePage);
    final isProgrammaticJump = useRef(false);

    // dispose 전까지 캐싱
    final anchorMonth = useMemoized(() => DateTime(now.year, now.month, 1));

    final focusedMonth = state.focusedMonth;
    final selectedDate = state.selectedDate;

    int pageForMonth(DateTime targetMonth) {
      final target = DateTime(targetMonth.year, targetMonth.month, 1);
      final diff = CalendarMonthCalc.diffMonths(anchorMonth, target);
      return basePage + diff;
    }

    void onMonthChanged(DateTime month) {
      final m = DateTime(month.year, month.month, 1);

      final wasProgrammatic = isProgrammaticJump.value;
      if (wasProgrammatic) {
        isProgrammaticJump.value = false;
      }

      final isCurrentMonth = (m.year == now.year && m.month == now.month);

      if (isCurrentMonth) {
        vm.setFocusedMonth(m, alsoSelectFirstDay: false);
        vm.setSelectedDate(now);
        return;
      }

      vm.setFocusedMonth(m, alsoSelectFirstDay: !wasProgrammatic);
    }

    Future<void> onDateSelected(DateTime d) async {
      final picked = DateTime(d.year, d.month, d.day);

      final currentMonth = DateTime(focusedMonth.year, focusedMonth.month, 1);
      final pickedMonth = DateTime(picked.year, picked.month, 1);

      vm.setSelectedDate(picked);

      if (pickedMonth != currentMonth) {
        vm.setFocusedMonth(pickedMonth);

        final targetPage = pageForMonth(pickedMonth);
        isProgrammaticJump.value = true;

        await pageController.animateToPage(
          targetPage,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    }

    final openYearMonthPicker = useCallback(() async {
      final result = await showYearMonthPicker(
        context,
        initialYear: focusedMonth.year,
        initialMonth: focusedMonth.month,
        minYear: 2000,
        maxYear: 2035,
      );
      if (result == null) return;

      final target = DateTime(result.year, result.month, 1);
      final targetPage = pageForMonth(target);

      isProgrammaticJump.value = true;

      await pageController.animateToPage(
        targetPage,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );

      final isCurrentMonth = (target.year == now.year && target.month == now.month);

      if (isCurrentMonth) {
        vm.setFocusedMonth(target, alsoSelectFirstDay: false);
        vm.setSelectedDate(now);
      } else {
        vm.setFocusedMonth(target, alsoSelectFirstDay: true);
      }
    }, [context, focusedMonth.year, focusedMonth.month]);

    // 선택된 날짜의 아이템
    final itemsForSelected = state.itemsForSelected;

    // 달력 높이 계산
    const cellHeight = 64.0;
    final weeks = CalendarMonthCalc.metrics(focusedMonth).weeks;
    final calendarHeight = weeks * cellHeight;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        vm.ensureCalendarLoaded(focusedMonth.year, focusedMonth.month);
      });
      return null;
    }, [focusedMonth.year, focusedMonth.month]);

    // 오류
    useEffect(() {
      if (state.errorMessage != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showCupertinoDialog(
            context: context,
            barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
            builder: (_) => CustomDialog(
              title: '일정',
              content: state.errorMessage!,
              actions: [
                CustomDialogAction(
                  text: '확인',
                  style: DialogActionStyle.normal,
                  onPressed: () {},
                ),
              ],
            ),
          );
        });
      }
      return null;
    }, [state.errorMessage]);

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _CalendarHeader(
                      month: focusedMonth,
                      onTapMonth: openYearMonthPicker,
                      onTapWrite: () async {
                        final created = await onTapWrite(false, selectedDate);
                        if (created != null) {
                          vm.applyUpsertEvent(created);
                        }
                      },
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
                      selectedDate: selectedDate,
                      cellHeight: cellHeight,
                      onMonthChanged: onMonthChanged,
                      onDateSelected: onDateSelected,
                      eventLookup: (d) {
                        final ymd = ymdHyphen(d);
                        return state.itemsByDate[ymd] ?? const <CalendarItem>[];
                      },
                    ),
                  ),

                  // 일정 목록
                  Expanded(
                    child: SelectedDayEventList(
                      onTapGift: onTapGift,
                      onTapEventDetail: onTapEventDetail,
                      events: itemsForSelected,
                    ),
                  ),
                ],
              ),
            ),
            if (state.isLoading)
              Positioned.fill(
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: CircularProgressIndicator(
                      color: ColorStyles.grayD3,
                    ),
                  ),
                ),
              ),
          ],
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
import 'package:flutter/cupertino.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

class DatePicker {
  final int year;
  final int month;
  final int day;
  const DatePicker(this.year, this.month, this.day);
}

Future<DatePicker?> showYmdPicker(
  BuildContext context, {
    required int initialYear,
    required int initialMonth,
    required int initialDay,
    int minYear = 1900,
    int maxYear = 2100,
  }) {
  int clamp(int v, int min, int max) => v < min ? min : (v > max ? max : v);

  int daysInMonth(int year, int month) {
    final nextMonth = (month == 12) ? 1 : month + 1;
    final nextYear = (month == 12) ? year + 1 : year;
    return DateTime(nextYear, nextMonth, 0).day; // 해당 월의 마지막 날
  }

  final safeYear = clamp(initialYear, minYear, maxYear);
  final safeMonth = clamp(initialMonth, 1, 12);
  final safeDay = clamp(initialDay, 1, daysInMonth(safeYear, safeMonth));

  return showCupertinoModalPopup<DatePicker>(
    context: context,
    barrierColor: ColorStyles.black22.withValues(alpha: 0.8),
    builder: (ctx) {
      int selectedYear = safeYear;
      int selectedMonth = safeMonth;
      int selectedDay = safeDay;

      final years = List.generate(maxYear - minYear + 1, (i) => minYear + i);

      final yearController = FixedExtentScrollController(
        initialItem: years.indexOf(safeYear),
      );
      final monthController = FixedExtentScrollController(initialItem: safeMonth - 1);
      final dayController = FixedExtentScrollController(initialItem: safeDay - 1);

      const itemExtent = 44.0;

      void closeWithSelection() {
        Navigator.of(ctx).pop(DatePicker(selectedYear, selectedMonth, selectedDay));
      }

      return CupertinoTheme(
        data: const CupertinoThemeData(brightness: Brightness.dark),
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: closeWithSelection,
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {}, // 바텀시트 터치로 닫히지 않게
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorStyles.black2D,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: SizedBox(
                    height: 280,
                    child: StatefulBuilder(
                      builder: (context, setModalState) {
                        final maxDay = daysInMonth(selectedYear, selectedMonth);

                        void normalizeDayIfNeeded() {
                          if (selectedDay > maxDay) {
                            selectedDay = maxDay;
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (dayController.hasClients) {
                                dayController.jumpToItem(selectedDay - 1);
                              }
                            });
                          }
                        }

                        return Row(
                          children: [
                            // 연
                            Expanded(
                              child: CupertinoPicker(
                                scrollController: yearController,
                                itemExtent: itemExtent,
                                magnification: 1.02,
                                useMagnifier: true,
                                selectionOverlay:
                                const CupertinoPickerDefaultSelectionOverlay(),
                                onSelectedItemChanged: (index) {
                                  setModalState(() {
                                    selectedYear = years[index];
                                    normalizeDayIfNeeded();
                                  });
                                },
                                children: years
                                  .map((y) => Center(
                                    child: Text(
                                      '$y년',
                                      style: TextStyles.largeTextBold.copyWith(
                                        color: ColorStyles.grayD3,
                                      ),
                                    ),
                                  ),
                                ).toList(),
                              ),
                            ),

                            // 월
                            Expanded(
                              child: CupertinoPicker(
                                scrollController: monthController,
                                itemExtent: itemExtent,
                                magnification: 1.02,
                                useMagnifier: true,
                                selectionOverlay:
                                const CupertinoPickerDefaultSelectionOverlay(),
                                onSelectedItemChanged: (index) {
                                  setModalState(() {
                                    selectedMonth = index + 1;
                                    normalizeDayIfNeeded();
                                  });
                                },
                                children: List.generate(12, (i) {
                                  final m = i + 1;
                                  return Center(
                                    child: Text(
                                      '$m월',
                                      style: TextStyles.largeTextBold.copyWith(
                                        color: ColorStyles.grayD3,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),

                            // 일 (월/년 따라 일수 변경)
                            Expanded(
                              child: CupertinoPicker(
                                scrollController: dayController,
                                itemExtent: itemExtent,
                                magnification: 1.02,
                                useMagnifier: true,
                                selectionOverlay:
                                const CupertinoPickerDefaultSelectionOverlay(),
                                onSelectedItemChanged: (index) {
                                  setModalState(() {
                                    selectedDay = index + 1;
                                  });
                                },
                                children: List.generate(maxDay, (i) {
                                  final d = i + 1;
                                  return Center(
                                    child: Text(
                                      '$d일',
                                      style: TextStyles.largeTextBold.copyWith(
                                        color: ColorStyles.grayD3,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
import 'package:flutter/cupertino.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

class CalendarPicker {
  final int year;
  final int month;
  const CalendarPicker(this.year, this.month);
}

Future<CalendarPicker?> showYearMonthPicker(
    BuildContext context, {
      required int initialYear,
      required int initialMonth,
      int minYear = 1900,
      int maxYear = 2100,
    }) {
  return showCupertinoModalPopup<CalendarPicker>(
    context: context,
    barrierColor: ColorStyles.black22.withValues(alpha: 0.8),
    builder: (ctx) {
      int selectedYear = initialYear;
      int selectedMonth = initialMonth;

      final years = List.generate(maxYear - minYear + 1, (i) => minYear + i);

      final yearInitialIndex = (initialYear - minYear).clamp(0, years.length - 1);
      final monthInitialIndex = (initialMonth - 1).clamp(0, 11);

      final yearController = FixedExtentScrollController(initialItem: yearInitialIndex);
      final monthController = FixedExtentScrollController(initialItem: monthInitialIndex);

      const itemExtent = 44.0;

      void closeWithSelection() {
        Navigator.of(ctx).pop(CalendarPicker(selectedYear, selectedMonth));
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
                onTap: () {},
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
                        return Row(
                          children: [
                            Expanded(
                              child: CupertinoPicker(
                                scrollController: yearController,
                                itemExtent: itemExtent,
                                magnification: 1.02,
                                useMagnifier: true,
                                selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(),
                                onSelectedItemChanged: (index) {
                                  setModalState(() {
                                    selectedYear = years[index];
                                  });
                                },
                                children: List.generate(years.length, (i) {
                                  final y = years[i];
                                  return Center(
                                    child: Text(
                                      '$y년',
                                      style: TextStyles.largeTextBold.copyWith(
                                        color: ColorStyles.grayD3,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            Expanded(
                              child: CupertinoPicker(
                                scrollController: monthController,
                                itemExtent: itemExtent,
                                magnification: 1.02,
                                useMagnifier: true,
                                selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(),
                                onSelectedItemChanged: (index) {
                                  setModalState(() {
                                    selectedMonth = index + 1;
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
import 'package:flutter/cupertino.dart';
import 'package:relog/core/presentation/ui/color_styles.dart';
import 'package:relog/core/presentation/ui/text_styles.dart';

class BirthdayPicker {
  final int month;
  final int day;
  const BirthdayPicker(this.month, this.day);
}

Future<BirthdayPicker?> showBirthdayPicker(
  BuildContext context, {
    required int initialMonth,
    required int initialDay,
  }) {
  return showCupertinoModalPopup<BirthdayPicker>(
    context: context,
    barrierColor: ColorStyles.black22.withValues(alpha: 0.8),
    builder: (ctx) {
      int selectedMonth = initialMonth;
      int selectedDay = initialDay;

      final monthController = FixedExtentScrollController(initialItem: initialMonth - 1);
      final dayController = FixedExtentScrollController(initialItem: initialDay - 1);

      const itemExtent = 44.0;

      void closeWithSelection() {
        Navigator.of(ctx).pop(BirthdayPicker(selectedMonth, selectedDay));
      }

      return CupertinoTheme(
        data: const CupertinoThemeData(
          brightness: Brightness.dark,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: closeWithSelection,
              ),
            ),

            // 바텀 시트
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
                            Expanded(
                              child: CupertinoPicker(
                                scrollController: dayController,
                                itemExtent: itemExtent,
                                magnification: 1.02,
                                useMagnifier: true,
                                selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(),
                                onSelectedItemChanged: (index) {
                                  setModalState(() {
                                    selectedDay = index + 1;
                                  });
                                },
                                children: List.generate(31, (i) {
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
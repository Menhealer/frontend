import 'package:flutter/cupertino.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

class CustomActionSheet {
  static void show(
    BuildContext context, {
      required List<ActionSheetItem> actions,
      String cancelText = '취소',
    }) {
    showCupertinoModalPopup(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: CupertinoTheme(
          data: CupertinoThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: ColorStyles.black22,
            barBackgroundColor: ColorStyles.black22,
            primaryColor: ColorStyles.infoBlue,
            textTheme: CupertinoTextThemeData(
              actionTextStyle: TextStyles.largeTextRegular,
            ),
          ),
          child: CupertinoActionSheet(
            actions: actions.map((action) {
              return CupertinoActionSheetAction(
                isDestructiveAction:
                action.type == ActionSheetItemType.destructive,
                onPressed: () {
                  Navigator.of(ctx).pop();
                  action.onTap();
                },
                child: Text(
                  action.label,
                  style: TextStyles.largeTextRegular.copyWith(
                    color: action.textColor ??
                      (action.type == ActionSheetItemType.destructive
                        ? ColorStyles.red10
                        : ColorStyles.infoBlue),
                  ),
                ),
              );
            }).toList(),
            cancelButton: CupertinoActionSheetAction(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(
                cancelText,
                style: TextStyles.largeTextBold.copyWith(
                  color: ColorStyles.infoBlue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum ActionSheetItemType {
  normal,
  destructive,
}

class ActionSheetItem {
  final String label;
  final VoidCallback onTap;
  final Color? textColor;
  final ActionSheetItemType type;

  const ActionSheetItem({
    required this.label,
    required this.onTap,
    this.textColor,
    this.type = ActionSheetItemType.normal,
  });
}
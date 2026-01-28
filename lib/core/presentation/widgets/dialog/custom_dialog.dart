import 'package:flutter/cupertino.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

enum DialogActionStyle {
  normal,
  destructive,
}

class CustomDialogAction {
  final String text;
  final VoidCallback onPressed;
  final DialogActionStyle style;
  final bool isDefaultAction;
  final bool dismissOnTap;

  const CustomDialogAction({
    required this.text,
    required this.onPressed,
    this.style = DialogActionStyle.normal,
    this.isDefaultAction = false,
    this.dismissOnTap = true,
  });
}

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;

  final List<CustomDialogAction> actions;

  final bool useRootNavigator;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.useRootNavigator = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoThemeData(
      brightness: Brightness.dark,
      primaryColor: ColorStyles.infoBlue,
      scaffoldBackgroundColor: ColorStyles.black22,
    );

    return CupertinoTheme(
      data: theme,
      child: CupertinoAlertDialog(
        title: Text(
          title,
          style: TextStyles.largeTextBold.copyWith(
            color: ColorStyles.grayD3,
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            content,
            style: TextStyles.normalTextRegular.copyWith(
              color: ColorStyles.grayA3,
            ),
          ),
        ),
        actions: actions.map((a) {
          final textColor = switch (a.style) {
            DialogActionStyle.destructive => ColorStyles.red100,
            DialogActionStyle.normal => ColorStyles.infoBlue,
          };

          return CupertinoDialogAction(
            isDefaultAction: a.isDefaultAction,
            isDestructiveAction: a.style == DialogActionStyle.destructive,
            onPressed: () {
              if (a.dismissOnTap && Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
              WidgetsBinding.instance.addPostFrameCallback((_) {
                a.onPressed();
              });
            },
            child: Text(
              a.text,
              style: TextStyles.largeTextRegular.copyWith(
                color: textColor,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
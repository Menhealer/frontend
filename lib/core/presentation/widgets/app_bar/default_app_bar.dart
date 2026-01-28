import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? trailing;
  final bool showBackButton;
  final bool defaultBackButtonIcon;
  final VoidCallback? onBack;

  const DefaultAppBar({
    super.key,
    this.title,
    this.trailing,
    this.showBackButton = true,
    this.defaultBackButtonIcon = true,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(44),
      child: AppBar(
        backgroundColor: ColorStyles.black22,
        elevation: 0,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        leading: showBackButton
          ? IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
              visualDensity: VisualDensity.compact,
              onPressed: onBack ?? () => context.pop(),
              highlightColor: Colors.transparent,
              icon: defaultBackButtonIcon
              ? Icon(
                  Icons.navigate_before,
                  color: ColorStyles.grayD3,
                  size: 24,
                )
              : Icon(
                  Icons.close,
                  color: ColorStyles.grayD3,
                  size: 24,
                ),
            )
          : null,
        title: title != null
          ? Text(
              title!,
              style:
              TextStyles.largeTextBold.copyWith(color: ColorStyles.grayD3),
            )
          : null,
        centerTitle: true,
        actions: trailing != null ? [trailing!] : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
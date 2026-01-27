import 'package:flutter/material.dart';
import 'package:relog/core/presentation/ui/color_styles.dart';
import 'package:relog/core/presentation/ui/text_styles.dart';

class SettingsSectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSectionCard({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorStyles.black2D,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.largeTextBold.copyWith(color: ColorStyles.white),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const SettingsItem({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final child = Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 44),
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: TextStyles.normalTextRegular.copyWith(
          color: ColorStyles.grayD3,
        ),
      ),
    );

    if (onTap == null) return child;

    return InkWell(
      onTap: onTap,
      child: child,
    );
  }
}
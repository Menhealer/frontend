import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

class CalendarScreen extends HookConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorStyles.black22,
      body: SafeArea(
        child: Center(
          child: Text(
            '일정 페이지',
            style: TextStyles.titleTextBold.copyWith(
              color: ColorStyles.white,
            ),
          ),
        ),
      ),
    );
  }
}
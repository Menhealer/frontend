import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/ui/color_styles.dart';
import 'package:relog/ui/text_styles.dart';

class FriendsScreen extends HookConsumerWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorStyles.black22,
      body: SafeArea(
        child: Center(
          child: Text(
            '친구 페이지',
            style: TextStyles.titleTextBold.copyWith(
              color: ColorStyles.white,
            ),
          ),
        ),
      ),
    );
  }
}
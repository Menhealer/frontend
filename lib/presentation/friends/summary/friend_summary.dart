import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/ui/color_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/presentation/friends/dummy.dart';
import 'package:relog/presentation/friends/widgets/summary_section.dart';

class FriendSummary extends HookConsumerWidget {

  const FriendSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      appBar: DefaultAppBar(
        title: 'AI 요약',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16,),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 관계 요약
                SummarySection(
                  title: '📊 관계 요약',
                  content: summaryDummy[0],
                  scrollable: true,
                ),
                const SizedBox(height: 24),
                SummarySection(
                  title: '💡 관계 솔루션',
                  content: summaryDummy[1],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
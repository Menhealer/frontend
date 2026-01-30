import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/presentation/home/widgets/best_worst_panel.dart';
import 'package:relog/presentation/home/widgets/empty_card.dart';
import 'package:relog/presentation/home/widgets/expandable_section.dart';
import 'package:relog/presentation/home/widgets/section_header.dart';
import 'package:relog/presentation/home/widgets/text_card.dart';

import 'home_dummy.dart';

class HomeScreen extends HookConsumerWidget {
  final VoidCallback onTapFriendship;

  const HomeScreen({
    super.key,
    required this.onTapFriendship,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = homeDummyData['monthlySummary'];
    final solution = homeDummyData['monthlySolution'];
    final relationshipSolution1 = homeDummyData['relationshipSolution1'];
    final relationshipSolution2 = homeDummyData['relationshipSolution2'];
    final bestPersonName = homeDummyData['bestPersonName'];
    final worstPersonName = homeDummyData['worstPersonName'];
    final friendRecommendations = homeDummyData['friendRecommendations'];

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 월별 정산
                SectionHeader(title: '${DateTime.now().month}월 정산'),
                const SizedBox(height: 24,),


                if (summary == null || solution == null)
                  const EmptyCard()
                else ...[
                  ExpandableSection(
                    title: '📊 이번 달 요약',
                    initiallyExpanded: true,
                    child: TextCard(text: summary),
                  ),
                  const SizedBox(height: 24),

                  ExpandableSection(
                    title: '💡 이번 달 솔루션',
                    child: TextCard(text: solution),
                  ),
                ],
                const SizedBox(height: 40,),

                // 분기별 정산
                SectionHeader(title: '${getQuarter(DateTime.now())}분기 정산'),
                const SizedBox(height: 24,),

                if (relationshipSolution1 == null || relationshipSolution2 == null || friendRecommendations == null)
                  const EmptyCard()
                else ...[
                  BestWorstPanel(
                    bestName: bestPersonName ?? '',
                    worstName: worstPersonName ?? '',
                    onTap: onTapFriendship,
                  ),
                  const SizedBox(height: 16),

                  ExpandableSection(
                    title: '📝 관계 솔루션',
                    child: Column(
                      children: [
                        TextCard(text: relationshipSolution1),
                        const SizedBox(height: 8),
                        TextCard(text: relationshipSolution2),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  ExpandableSection(
                    title: '🧩 친구 관계 추천',
                    child: TextCard(text: friendRecommendations),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
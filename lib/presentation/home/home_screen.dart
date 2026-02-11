import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/presentation/home/providers/home_view_providers.dart';
import 'package:relog/presentation/home/widgets/best_worst_panel.dart';
import 'package:relog/presentation/home/widgets/empty_card.dart';
import 'package:relog/presentation/home/widgets/expandable_section.dart';
import 'package:relog/presentation/home/widgets/section_header.dart';
import 'package:relog/presentation/home/widgets/text_card.dart';

class HomeScreen extends HookConsumerWidget {
  final VoidCallback onTapFriendship;

  const HomeScreen({
    super.key,
    required this.onTapFriendship,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateTime date = DateTime.now();
    final int year = date.year;
    final int month = date.month;
    final int quarter = getQuarter(date);

    final state = ref.watch(homeViewModelProvider);
    final vm = ref.read(homeViewModelProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        vm.loadAnalysis(year, month, quarter);
      });
      return null;
    }, []);

    // 오류
    useEffect(() {
      if (state.errorMessage != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showCupertinoDialog(
            context: context,
            barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
            builder: (_) => CustomDialog(
              title: '정산 기록',
              content: state.errorMessage!,
              actions: [
                CustomDialogAction(
                  text: '확인',
                  style: DialogActionStyle.normal,
                  onPressed: () {},
                ),
              ],
            ),
          );
        });
      }
      return null;
    }, [state.errorMessage]);

    // 로딩 상태 표시
    if (state.isLoading) {
      return Scaffold(
        backgroundColor: ColorStyles.black22,
        body: SafeArea(
          child: Center(
            child: CircularProgressIndicator(color: ColorStyles.grayD3,),
          ),
        ),
      );
    }

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

                if (!state.hasMonthlySection)
                  const EmptyCard()
                else ...[
                  ExpandableSection(
                    title: '📊 이번 달 요약',
                    initiallyExpanded: true,
                    child: TextCard(text: state.monthlyAnalysisText),
                  ),
                  const SizedBox(height: 24),
                  ExpandableSection(
                    title: '💡 이번 달 솔루션',
                    child: TextCard(text: state.monthlySuggestionsText),
                  ),
                ],
                const SizedBox(height: 40,),

                // 분기별 정산
                SectionHeader(title: '${getQuarter(DateTime.now())}분기 정산'),
                const SizedBox(height: 24,),

                if (!state.hasQuarterlySection)
                  const EmptyCard()
                else ...[
                  BestWorstPanel(
                    bestName: state.bestFriendName,
                    worstName: state.worstFriendName,
                    onTap: onTapFriendship,
                  ),
                  const SizedBox(height: 16),

                  ExpandableSection(
                    title: '📝 관계 솔루션',
                    child: Column(
                      children: [
                        TextCard(text: state.quarterlyOverallAnalysisText),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  ExpandableSection(
                    title: '🧩 친구 관계 추천',
                    child: TextCard(text: state.quarterlySolutionText),
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
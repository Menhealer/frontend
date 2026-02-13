import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/home/model/friend_info.dart';
import 'package:relog/presentation/home/providers/home_view_providers.dart';
import 'package:relog/presentation/home/widgets/best_worst_panel.dart';
import 'package:relog/presentation/home/widgets/empty_card.dart';
import 'package:relog/presentation/home/widgets/expandable_section.dart';
import 'package:relog/presentation/home/widgets/section_header.dart';
import 'package:relog/presentation/home/widgets/text_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends HookConsumerWidget {
  final void Function(List<FriendInfo> bestFriends, List<FriendInfo> worstFriends) onTapFriendship;

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

    Future<void> clearHomeCacheForDebug() async {
      final prefs = await SharedPreferences.getInstance();
      final keys = prefs.getKeys();

      var removed = 0;
      for (final k in keys) {
        if (k.startsWith('home_monthly') || k.startsWith('home_quarterly')) {
          final ok = await prefs.remove(k);
          if (ok) removed++;
        }
      }

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('홈 캐시 삭제 완료: $removed개'),
          duration: const Duration(seconds: 2),
        ),
      );
    }


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
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (kDebugMode) ...[
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        showCupertinoDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (_) => CustomDialog(
                            title: '테스트',
                            content: '홈(월별/분기별) 캐시 데이터를 삭제할까요?',
                            actions: [
                              CustomDialogAction(
                                text: '취소',
                                style: DialogActionStyle.normal,
                                onPressed: () {},
                              ),
                              CustomDialogAction(
                                text: '삭제',
                                style: DialogActionStyle.destructive,
                                isDefaultAction: true,
                                onPressed: () async {
                                  await clearHomeCacheForDebug();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.delete_outline),
                      label: const Text('홈 캐시 삭제(테스트용)'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: ColorStyles.grayD3,
                        side: const BorderSide(color: ColorStyles.black42),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

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
                    onTap: () {
                      final q = state.quarterly;
                      if (q == null) return;

                      final best = q.bestFriends.whereType<FriendInfo>().toList();
                      final worst = q.worstFriends.whereType<FriendInfo>().toList();

                      onTapFriendship(best, worst);
                    },
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
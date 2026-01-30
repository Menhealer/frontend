import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/presentation/home/home_dummy.dart';
import 'package:relog/presentation/home/widgets/friendship_card.dart';
import 'package:relog/presentation/home/widgets/friendship_tab_bar.dart';

class FriendshipScreen extends HookConsumerWidget {
  final void Function(int id) onTapFriendDetail;

  const FriendshipScreen({
    super.key,
    required this.onTapFriendDetail,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bestItems = bestDummy;
    final worstItems = worstDummy;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorStyles.black22,
        appBar: DefaultAppBar(
          title: '친구 관계 추천',
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // 상단 카테고리(베스트 / 워스트) 탭
                FriendshipTabBar(),
                const SizedBox(height: 16),

                // 카드 위젯
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ListView.separated(
                        itemCount: bestItems.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final item = bestItems[index];
                          return FriendshipCard(
                            onTap: () => onTapFriendDetail(item.id),
                            item: item,
                          );
                        },
                      ),
                      ListView.separated(
                        itemCount: worstItems.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final item = worstItems[index];
                          return FriendshipCard(
                            onTap: () => onTapFriendDetail(item.id),
                            item: item,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
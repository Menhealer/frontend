import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/domain/home/model/friend_info.dart';
import 'package:relog/presentation/home/widgets/friendship_card.dart';
import 'package:relog/presentation/home/widgets/friendship_tab_bar.dart';

class FriendshipScreen extends HookConsumerWidget {
  final List<FriendInfo> bestFriends;
  final List<FriendInfo> worstFriends;
  final void Function(int friendId) onTapFriendDetail;

  const FriendshipScreen({
    super.key,
    required this.bestFriends,
    required this.worstFriends,
    required this.onTapFriendDetail,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
                        itemCount: bestFriends.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final friend = bestFriends[index];
                          return FriendshipCard(
                            onTap: () => onTapFriendDetail(friend.friend.id),
                            item: friend,
                          );
                        },
                      ),
                      ListView.separated(
                        itemCount: worstFriends.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final friend = worstFriends[index];
                          return FriendshipCard(
                            onTap: () => onTapFriendDetail(friend.friend.id),
                            item: friend,
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
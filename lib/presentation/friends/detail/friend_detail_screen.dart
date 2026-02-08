import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/action_sheet/custom_action_sheet.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/buttons/secondary_button.dart';
import 'package:relog/core/presentation/widgets/cards/gift_card.dart';
import 'package:relog/core/presentation/widgets/chip/info_chip.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/storage/providers/user_session_provider.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/presentation/friends/providers/friends_view_providers.dart';
import 'package:relog/presentation/friends/widgets/event_card.dart';
import 'package:relog/presentation/friends/widgets/score_bar.dart';

class FriendDetailScreen extends HookConsumerWidget {
  final int friendId;
  final VoidCallback onTapSummary;
  final void Function(Friend friend) onTapGift;
  final void Function(int id) onTapEventDetail;
  final Future<Friend?> Function(bool isEdit, Friend friendInfo) onTapEdit;

  const FriendDetailScreen({
    super.key,
    required this.friendId,
    required this.onTapSummary,
    required this.onTapGift,
    required this.onTapEventDetail,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userSessionProvider);
    final user = userAsync.asData?.value;

    final state = ref.watch(friendDetailViewModelProvider);
    final vm = ref.read(friendDetailViewModelProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        vm.loadFriend(friendId);
      });
      return null;
    }, [friendId]);

    final scoreTextColor = state.isPositive ? ColorStyles.green100 : ColorStyles.red100;

    final recentEvents = state.recent3Events;
    final recentGifts = state.recent3Gifts;

    // 오류
    useEffect(() {
      if (state.errorMessage != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showCupertinoDialog(
            context: context,
            barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
            builder: (_) => CustomDialog(
              title: '친구 정보',
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

    final friend = state.friend;
    if (user == null || friend == null) {
      return const SizedBox.shrink();
    }
    final group = state.groupOrNull;
    final birthday = state.birthdayOrNull;

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      appBar: DefaultAppBar(
        title: '친구 정보',
        trailing: IconButton(
          onPressed: () {
            CustomActionSheet.show(
              context,
              actions: [
                ActionSheetItem(
                  label: '친구 정보 수정',
                  onTap: () async {
                    final updated = await onTapEdit(true, friend);
                    if (updated != null) {
                      ref.read(friendsViewModelProvider.notifier).upsertFriend(updated);
                      await vm.loadFriend(friendId, force: true);
                    }
                  }
                ),
                ActionSheetItem(
                  label: '친구 삭제',
                  type: ActionSheetItemType.destructive,
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
                      builder: (_) => CustomDialog(
                        title: '친구 삭제',
                        content: '삭제하면 되돌릴 수 없어요.\n정말로 친구를 삭제할까요?',
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
                              final ok = await vm.friendDelete(friendId);
                              if (ok && context.mounted) context.pop(true);
                            },
                          ),
                        ],
                      ),
                    );
                    // 삭제 로직
                  },
                ),
              ],
            );
          },
          icon: SvgPicture.asset(
            'assets/icons/kebab_menu.svg',
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              ColorStyles.grayD3,
              BlendMode.srcIn,
            ),
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
          visualDensity: VisualDensity.compact,
          highlightColor: Colors.transparent,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16,),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 친구 정보
                SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          friend.name,
                          style: TextStyles.titleTextBold.copyWith(
                            color: ColorStyles.grayD3,
                          ),
                        ),
                        const SizedBox(width: 16,),

                        if (group != null) ...[
                          InfoChip(
                            label: group,
                            backgroundColor: ColorStyles.purple100,
                            textColor: ColorStyles.purple10,
                          ),
                          const SizedBox(width: 8,),
                        ],

                        if (birthday != null)
                          InfoChip(
                            label: formatBirthday(birthday),
                            backgroundColor: ColorStyles.pink100,
                            textColor: ColorStyles.pink10,
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24,),

                // 관계 상태
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorStyles.black2D,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user.nickname}님의 관계 상태',
                        style: TextStyles.largeTextBold.copyWith(
                          color: ColorStyles.grayD3,
                        ),
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        width: double.infinity,
                        child: ScoreBar(
                          score: state.rawScore,
                          height: 40,
                        ),
                      ),
                      const SizedBox(height: 8,),

                      Align(
                        alignment: Alignment.centerRight,
                        child: friend.score == 0
                          ? Text(
                              '표시될 만큼 정보가 없어요',
                              style: TextStyles.smallTextRegular.copyWith(
                                color: ColorStyles.grayA3,
                              ),
                            )
                          : Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: state.scorePercentText,
                                    style: TextStyles.smallTextRegular.copyWith(
                                      color: scoreTextColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: state.sentimentText,
                                    style: TextStyles.smallTextRegular.copyWith(
                                      color: ColorStyles.grayA3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8,),

                // AI 요약
                SecondaryButton(
                  label: 'AI 요약 보기',
                  minHeight: 44,
                  onTap: onTapSummary,
                ),
                const SizedBox(height: 40,),

                // 일정 기록
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ColorStyles.black2D,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 8,
                          children: [
                            Text(
                              '${friend.name}님과의 기록',
                              style: TextStyles.largeTextBold.copyWith(
                                color: ColorStyles.grayD3,
                              ),
                            ),
                            Text(
                              '최근 기록 3개만 보여져요',
                              style: TextStyles.smallTextRegular.copyWith(
                                color: ColorStyles.grayA3,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 일정 카드
                      if (recentEvents.isEmpty)
                        SizedBox(
                          height: 48,
                          child: Center(
                            child: Text(
                              '아무 기록이 없어요',
                              style: TextStyles.normalTextRegular.copyWith(
                                color: ColorStyles.grayA3,
                              ),
                            ),
                          ),
                        )
                      else
                        Column(
                          spacing: 8,
                          children: [
                            for (final event in recentEvents) GestureDetector(
                              onTap: () => onTapEventDetail(event.eventId),
                              behavior: HitTestBehavior.opaque,
                              child: EventCard(event: event)
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 40,),

                // 선물 기록
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  decoration: BoxDecoration(
                    color: ColorStyles.black2D,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    spacing: 16,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              '최근 선물 기록',
                              style: TextStyles.largeTextBold.copyWith(
                                color: ColorStyles.grayD3,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => onTapGift(friend),
                            behavior: HitTestBehavior.opaque,
                            child: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '더보기',
                                  style: TextStyles.smallTextRegular.copyWith(
                                    color: ColorStyles.grayD3,
                                  ),
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: ColorStyles.grayD3,
                                  size: 16,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      // 선물 카드
                      if (recentGifts.isEmpty)
                        SizedBox(
                          height: 48,
                          child: Center(
                            child: Text(
                              '아무 기록이 없어요',
                              style: TextStyles.normalTextRegular.copyWith(
                                color: ColorStyles.grayA3,
                              ),
                            ),
                          ),
                        )
                      else
                        Column(
                          spacing: 8,
                          children: [
                            for (final gift in recentGifts)
                              GiftsCard(
                                nickname: user.nickname,
                                gift: GiftDetail(
                                  id: gift.giftId,
                                  price: gift.price,
                                  giftDate: gift.giftDate,
                                  giftType: gift.giftType,
                                  direction: gift.direction,
                                  friendId: friendId,
                                  friendName: friend.name,
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/action_sheet/custom_action_sheet.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/buttons/secondary_button.dart';
import 'package:relog/core/presentation/widgets/cards/present_card.dart';
import 'package:relog/core/presentation/widgets/chip/info_chip.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/friends/friend_edit.dart';
import 'package:relog/domain/presents/present_friend.dart';
import 'package:relog/presentation/friends/dummy.dart';
import 'package:relog/presentation/friends/widgets/event_card.dart';
import 'package:relog/presentation/friends/widgets/score_bar.dart';

class FriendDetailScreen extends HookConsumerWidget {
  final int id;
  final VoidCallback onTapSummary;
  final void Function(PresentFriend info) onTapPresent;
  final void Function(bool isEdit, FriendEdit friendInfo) onTapEdit;

  const FriendDetailScreen({
    super.key,
    required this.id,
    required this.onTapSummary,
    required this.onTapPresent,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 사용자 정보
    const nickname = '주꾸미';
    final friend = dummyFriendDetails.firstWhere(
      (d) => d.id == id,
    );

    final clampedScore = friend.score.clamp(-100, 100);
    final scoreTextColor = clampedScore >= 0
        ? ColorStyles.green100
        : ColorStyles.red100;

    final events = friend.eventList ?? [];
    final recentEvents = events.take(3).toList();

    final presents = friend.presentList ?? [];
    final recentPresents = presents.take(3).toList();

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
                  onTap: () => onTapEdit(true, FriendEdit(id: friend.id, name: friend.name, group: friend.group, birthday: friend.birthday)),
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
                            onPressed: () {
                              // 삭제 로직
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
                Row(
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

                    if (friend.group != null) ...[
                      InfoChip(
                        label: friend.group!,
                        backgroundColor: ColorStyles.purple100,
                        textColor: ColorStyles.purple10,
                      ),
                      const SizedBox(width: 8,),
                    ],

                    if (friend.birthday != null)
                      InfoChip(
                        label: formatBirthday(friend.birthday!),
                        backgroundColor: ColorStyles.pink100,
                        textColor: ColorStyles.pink10,
                      ),
                  ],
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
                        '$nickname님과의 관계 상태',
                        style: TextStyles.largeTextBold.copyWith(
                          color: ColorStyles.grayD3,
                        ),
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        width: double.infinity,
                        child: ScoreBar(
                          score: friend.score,
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
                                    text: '${clampedScore.abs()}% ',
                                    style: TextStyles.smallTextRegular.copyWith(
                                      color: scoreTextColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: clampedScore >= 0 ? '긍정적' : '부정적',
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
                            for (final event in recentEvents) EventCard(event: event),
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
                            onTap: () => onTapPresent(PresentFriend(id: friend.id, name: friend.name, group: friend.group, birthday: friend.birthday)),
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
                      if (recentPresents.isEmpty)
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
                            for (final present in recentPresents)
                              PresentCard(nickname: nickname, present: present),
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
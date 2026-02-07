import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/action_sheet/custom_action_sheet.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/cards/gift_card.dart';
import 'package:relog/core/presentation/widgets/chip/info_chip.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/friends/model/friend_write_request.dart';
import 'package:relog/domain/gifts/gift_detail.dart';
import 'package:relog/presentation/friends/dummy.dart';

class GiftsScreen extends HookConsumerWidget {
  final int id;
  final void Function(bool isEdit, String friendName) onTapWrite;
  final void Function(bool isEdit, String friendName, GiftDetail present) onTapEdit;

  const GiftsScreen({
    super.key,
    required this.id,
    required this.onTapWrite,
    required this.onTapEdit
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 사용자 정보
    const nickname = '주꾸미';
    final friendInfo = FriendWriteRequest(name: '햄스터', group: '동아리', birthday: '2003-10-12');

    final List<GiftDetail> presents = presentList;

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      appBar: DefaultAppBar(
        title: '선물 기록',
        trailing: IconButton(
          onPressed: () => onTapWrite(false, friendInfo.name),
          icon: Icon(
            Icons.add,
            color: ColorStyles.grayD3,
            size: 24,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
          visualDensity: VisualDensity.compact,
          highlightColor: Colors.transparent,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              // 선물 기록
              presents.isEmpty
                ? Center(
                    child: Text(
                      '아무 기록이 없어요',
                      style: TextStyles.normalTextRegular.copyWith(
                        color: ColorStyles.grayA3,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.only(top: 64),
                    itemCount: presents.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final present = presents[index];
                      return Column(
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              CustomActionSheet.show(
                                context,
                                actions: [
                                  ActionSheetItem(
                                    label: '선물 기록 수정',
                                    onTap: () => onTapEdit(
                                      true,
                                      friendInfo.name,
                                      present,
                                    ),
                                  ),
                                  ActionSheetItem(
                                    label: '선물 기록 삭제',
                                    type: ActionSheetItemType.destructive,
                                    onTap: () {
                                      showCupertinoDialog(
                                        context: context,
                                        barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
                                        builder: (_) => CustomDialog(
                                          title: '선물 기록 삭제',
                                          content: '삭제하면 되돌릴 수 없어요.\n정말로 선물 기록을 삭제할까요?',
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
                            child: GiftsCard(
                              nickname: nickname,
                              gift: present,
                            ),
                          ),
                        ],
                      );
                    },
                  ),

              // 친구 정보
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ColorStyles.black22,
                        ColorStyles.black22.withValues(alpha: 0),
                      ],
                      stops: const [0.5, 1.0],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Expanded(
                        child: Text(
                          '${friendInfo.name}님과의 기록',
                          style: TextStyles.largeTextBold.copyWith(
                            color: ColorStyles.grayD3,
                          ),
                        ),
                      ),
                      if (friendInfo.group != null)
                        InfoChip(
                          label: friendInfo.group!,
                          backgroundColor: ColorStyles.purple100,
                          textColor: ColorStyles.purple10,
                        ),
                
                      if (friendInfo.birthday != null)
                        InfoChip(
                          label: formatBirthday(friendInfo.birthday!),
                          backgroundColor: ColorStyles.pink100,
                          textColor: ColorStyles.pink10,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
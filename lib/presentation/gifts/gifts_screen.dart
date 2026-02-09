import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/action_sheet/custom_action_sheet.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/cards/gift_card.dart';
import 'package:relog/core/presentation/widgets/chip/info_chip.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/storage/providers/user_session_provider.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/presentation/gifts/providers/gifts_view_providers.dart';

class GiftsScreen extends HookConsumerWidget {
  final Friend friend;
  final Future<GiftDetail?> Function(bool isEdit, Friend friend) onTapWrite;
  final Future<GiftDetail?> Function(bool isEdit, Friend friend, GiftDetail giftInfo) onTapEdit;

  const GiftsScreen({
    super.key,
    required this.friend,
    required this.onTapWrite,
    required this.onTapEdit
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userSessionProvider);
    final user = userAsync.asData?.value;

    final state = ref.watch(giftsViewModelProvider);
    final vm = ref.read(giftsViewModelProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        vm.loadGifts(friend.id);
      });
      return null;
    }, [friend.id]);

    // 오류
    useEffect(() {
      if (state.errorMessage != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showCupertinoDialog(
            context: context,
            barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
            builder: (_) => CustomDialog(
              title: '선물 기록',
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

    if (user == null) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      appBar: DefaultAppBar(
        title: '선물 기록',
        trailing: IconButton(
          onPressed: () async {
            final created = await onTapWrite(false, friend);
            if (created != null) {
              vm.upsertGift(created);
              vm.syncRecent3ToFriendDetail(friend.id, ref);
            }
          },
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
              state.gifts.isEmpty
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
                    itemCount: state.gifts.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final gift = state.gifts[index];
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
                                    onTap: () async {
                                      final updated = await onTapEdit(true, friend, gift);
                                      if (updated != null) {
                                        vm.upsertGift(updated);
                                        vm.syncRecent3ToFriendDetail(friend.id, ref);
                                      }
                                    },
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
                                              onPressed: () async {
                                                final ok = await vm.giftDelete(gift.id);
                                                if (ok) {
                                                  vm.syncRecent3ToFriendDetail(friend.id, ref);
                                                }
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
                              nickname: user.nickname,
                              gift: gift,
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
                          '${friend.name}님과의 기록',
                          style: TextStyles.largeTextBold.copyWith(
                            color: ColorStyles.grayD3,
                          ),
                        ),
                      ),
                      if (friend.group != null && friend.group != '')
                        InfoChip(
                          label: friend.group!,
                          backgroundColor: ColorStyles.purple100,
                          textColor: ColorStyles.purple10,
                        ),
                
                      if (friend.birthday != null)
                        InfoChip(
                          label: formatBirthday(friend.birthday!),
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
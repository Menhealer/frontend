import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/action_sheet/custom_action_sheet.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/utils/review_mapping.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/events/enum/review_score.dart';
import 'package:relog/domain/events/model/event_detail.dart';

class EventDetailScreen extends HookConsumerWidget {
  final int id;
  final void Function(bool isEdit, EventDetail event) onTapEdit;

  const EventDetailScreen({
    super.key,
    required this.id,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      appBar: DefaultAppBar(
        title: '일정 상세',
        trailing: IconButton(
          onPressed: () {
            CustomActionSheet.show(
              context,
              actions: [
                ActionSheetItem(
                  label: '일정 수정',
                  onTap: () => onTapEdit(true, event),
                ),
                ActionSheetItem(
                  label: '일정 삭제',
                  type: ActionSheetItemType.destructive,
                  onTap: () {
                    showCupertinoDialog(
                      context: context,
                      barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
                      builder: (_) => CustomDialog(
                        title: '일정 삭제',
                        content: '일정 삭제는 되돌릴 수 없어요.\n정말로 일정을 삭제할까요?',
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 일정 정보
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '고양이',
                      // text: event.title,
                      style: TextStyles.normalTextBold.copyWith(
                        color: ColorStyles.purple10,
                      ),
                    ),
                    TextSpan(
                      text: '님과의 일정이에요',
                      style: TextStyles.normalTextRegular.copyWith(
                        color: ColorStyles.grayA3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: 8,
                children: [
                  Expanded(
                    child: Text(
                      '더미데이터',
                      // event.title,
                      style: TextStyles.titleTextBold.copyWith(
                        color: ColorStyles.grayD3,
                      ),
                    ),
                  ),
                  Text(
                    formatPeriodDate('2026-01-01'),
                    // formatPeriodDate(event.eventDate),
                    style: TextStyles.smallTextRegular.copyWith(
                      color: ColorStyles.grayA3,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16,),
              Divider(color: ColorStyles.black42,),
              const SizedBox(height: 16,),

              // 일정 리뷰
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [
                  Text(
                    '일정 리뷰',
                    style: TextStyles.normalTextBold.copyWith(
                      color: ColorStyles.grayD3,
                    ),
                  ),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: scoreToColor(1),
                      // color: scoreToColor(event.reviewScore.toInt),
                      shape: BoxShape.circle,
                    ),
                  ),
                ]
              ),
              const SizedBox(height: 24,),
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxHeight: 160, minHeight: 80),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorStyles.black2D,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '등록된 리뷰가 없어요\n일정이 끝나셨다면, 리뷰를 등록해 주세요',
                    textAlign: TextAlign.center,
                    style: TextStyles.normalTextRegular.copyWith(
                      color: ColorStyles.grayA3,
                    ),
                  ),
                ),
                // child: event.reviewText != null
                //   ? SingleChildScrollView(
                //       child: Text(
                //         event.reviewText!,
                //         style: TextStyles.normalTextRegular.copyWith(
                //           color: ColorStyles.grayD3,
                //         ),
                //       ),
                //     )
                //   : Center(
                //       child: Text(
                //         '등록된 리뷰가 없어요\n일정이 끝나셨다면, 리뷰를 등록해 주세요',
                //         textAlign: TextAlign.center,
                //         style: TextStyles.normalTextRegular.copyWith(
                //           color: ColorStyles.grayA3,
                //         ),
                //       ),
                //     ),
              ),
              const SizedBox(height: 8,),
              if (event.reviewText == null)
                GestureDetector(
                  onTap: () => onTapEdit(true, event),
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 8,
                    children: [
                      Text(
                        '리뷰 등록하러 가기',
                        style: TextStyles.normalTextRegular.copyWith(
                          color: ColorStyles.gray86,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: ColorStyles.gray86,
                        size: 16,
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
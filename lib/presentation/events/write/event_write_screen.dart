import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/buttons/app_bar_done_button.dart';
import 'package:relog/core/presentation/widgets/buttons/picker_field.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/presentation/widgets/inputs/custom_text_field.dart';
import 'package:relog/core/presentation/widgets/picker/date_picker.dart';
import 'package:relog/core/utils/review_mapping.dart';
import 'package:relog/domain/events/model/event_detail.dart';
import 'package:relog/presentation/events/providers/events_view_providers.dart';
import 'package:relog/presentation/events/widgets/score_radio_button.dart';

class EventWriteScreen extends HookConsumerWidget {
  final bool isEdit;
  final DateTime? date;
  final EventDetail? event;
  final Future<Map<String, dynamic>?> Function() onTapSearchFriend;

  const EventWriteScreen({
    super.key,
    required this.isEdit,
    this.date,
    this.event,
    required this.onTapSearchFriend,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(eventWriteViewModelProvider);
    final vm = ref.read(eventWriteViewModelProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        vm.initialize(isEdit: isEdit, event: event, date: date);
      });
      return null;
    }, [isEdit, event?.id]);

    final titleController = useTextEditingController();
    useEffect(() {
      if (titleController.text != state.title) {
        titleController.text = state.title ?? '';
      }
      return null;
    }, [state.title]);

    final reviewTextController = useTextEditingController();
    useEffect(() {
      if (reviewTextController.text != state.reviewText) {
        reviewTextController.text = state.reviewText;
      }
      return null;
    }, [state.reviewText]);

    final reviewTextLen = reviewTextController.text.characters.length;

    // 날짜 선택
    final openPicker = useCallback(() async {
      final result = await showYmdPicker(
        context,
        initialYear: state.year ?? DateTime.now().year,
        initialMonth: state.month ?? DateTime.now().month,
        initialDay: state.day ?? DateTime.now().day,
      );
      if (result != null) {
        vm.onDatePicked(result);
      }
    }, [context, state.year, state.month, state.day]);

    // 오류
    useEffect(() {
      if (state.errorMessage != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showCupertinoDialog(
            context: context,
            barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
            builder: (_) => CustomDialog(
              title: '일정',
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
      appBar: DefaultAppBar(
        title: isEdit ? '일정 수정' : '일정 등록',
        defaultBackButtonIcon: false,
        trailing: AppBarDoneButton(
          enabled: state.canSubmit,
          onTap: () async {
            final result = await vm.submit();
            if (result != null && context.mounted) {
              context.pop(result);
            }
          },
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 16,),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 날짜
                  _FieldLabel('일자 *'),
                  const SizedBox(height: 16,),
              
                  PickerField(
                    placeholder: '일자를 선택해 주세요',
                    valueText: state.isDateValid
                        ? '${state.year}년 ${state.month}월 ${state.day}일'
                        : null,
                    onTap: openPicker,
                  ),
                  const SizedBox(height: 24,),
              
                  // 제목
                  _FieldLabel('제목 *'),
                  const SizedBox(height: 16,),
              
                  CustomTextField(
                    controller: titleController,
                    hintText: '최대 12글자 입력 가능해요',
                    maxLength: 12,
                    onChanged: vm.onTitleChanged,
                  ),
                  const SizedBox(height: 24,),
              
                  // 친구
                  _FieldLabel('친구 *'),
                  const SizedBox(height: 16,),
              
                  PickerField(
                    placeholder: '친구를 선택해 주세요',
                    valueText: state.friendName.isEmpty ? null : state.friendName,
                    onTap: () async {
                      final r = await onTapSearchFriend();
                      if (r != null) {
                        vm.onFriendSelected(r['id'], r['name']);
                      }
                    },
                  ),
                  const SizedBox(height: 24,),
              
                  // 리뷰
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 8,
                    children: [
                      Text(
                        '일정 리뷰',
                        style: TextStyles.normalTextBold.copyWith(color: ColorStyles.white),
                      ),
                      Text(
                        '일정에 대한 소감을 알려주세요',
                        style: TextStyles.smallTextRegular.copyWith(color: ColorStyles.gray86),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 24,
                    children: List.generate(5, (index) {
                      final score = index + 1;
                      final selected = scoreToInt(state.reviewScore);
                      return ScoreRadioButton(
                        score: score,
                        isSelected: score == selected,
                        onTap: () => vm.onReviewScoreSelected(intToScore(score)),
                      );
                    }),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxHeight: 120),
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorStyles.black2D,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      controller: reviewTextController,
                      onChanged: vm.onReviewTextChanged,
                      maxLength: 100,
                      maxLines: null,
                      minLines: 4,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      textAlignVertical: TextAlignVertical.top,
                      style: TextStyles.normalTextRegular.copyWith(
                        color: ColorStyles.white,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        border: InputBorder.none,
                        hintText: '일정에 대한 간단한 소감을 입력해 주세요',
                        hintStyle: TextStyles.normalTextRegular.copyWith(
                          color: ColorStyles.grayD3,
                        ),
                        counterText: '',
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '$reviewTextLen/100',
                      style: TextStyles.smallTextRegular.copyWith(
                        color: ColorStyles.grayD3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.normalTextBold.copyWith(color: ColorStyles.white),
    );
  }
}
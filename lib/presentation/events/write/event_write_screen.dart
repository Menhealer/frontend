import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/buttons/app_bar_done_button.dart';
import 'package:relog/core/presentation/widgets/buttons/picker_field.dart';
import 'package:relog/core/presentation/widgets/inputs/custom_text_field.dart';
import 'package:relog/core/presentation/widgets/picker/date_picker.dart';
import 'package:relog/domain/events/enum/review_score.dart';
import 'package:relog/domain/events/model/event_detail.dart';
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
    // 초기값
    final initial = _InitialValues.from(isEdit: isEdit, date: date, event: event);

    // 입력 필드
    final selectedDate = useState<DateTime>(initial.date);
    final selectedFriendName = useState<String?>(initial.friendName);
    final selectedScore = useState<int?>(initial.score);

    final titleController = useTextEditingController(text: initial.title);
    final infoController = useTextEditingController(text: initial.info);

    // controller 변화 감지
    useListenable(titleController);
    useListenable(infoController);

    final infoLen = infoController.text.characters.length;

    // 날짜 선택
    Future<void> openDatePicker() async {
      final d = selectedDate.value;
      final result = await showYmdPicker(
        context,
        initialYear: d.year,
        initialMonth: d.month,
        initialDay: d.day,
      );
      if (result == null) return;

      selectedDate.value = DateTime(result.year, result.month, result.day);
    }

    // 친구 선택
    Future<void> pickFriend() async {
      final result = await onTapSearchFriend();
      if (result == null) return;

      final int friendId = result['id'];
      final String friendName = result['name'];
      selectedFriendName.value = friendName;
    }

    // 버튼 활성화 조건
    final enabled = _canSubmit(
      isEdit: isEdit,
      origin: initial,
      current: _CurrentValues(
        date: selectedDate.value,
        title: titleController.text,
        friendName: selectedFriendName.value,
        score: selectedScore.value,
        info: infoController.text,
      ),
    );

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      appBar: DefaultAppBar(
        title: isEdit ? '일정 수정' : '일정 등록',
        defaultBackButtonIcon: false,
        trailing: AppBarDoneButton(
          enabled: enabled,
          onTap: () {
            // TODO: 일정 등록 API || 일정 수정 API
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
                    valueText: '${selectedDate.value.year}년 ${selectedDate.value.month}월 ${selectedDate.value.day}일',
                    onTap: openDatePicker,
                  ),
                  const SizedBox(height: 24,),
              
                  // 제목
                  _FieldLabel('제목 *'),
                  const SizedBox(height: 16,),
              
                  CustomTextField(
                    controller: titleController,
                    hintText: '일정 제목을 입력해 주세요',
                  ),
                  const SizedBox(height: 24,),
              
                  // 친구
                  _FieldLabel('친구 *'),
                  const SizedBox(height: 16,),
              
                  PickerField(
                    placeholder: '친구를 선택해 주세요',
                    valueText: selectedFriendName.value,
                    onTap: pickFriend,
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
              
                      return ScoreRadioButton(
                        score: score,
                        isSelected: score == selectedScore.value,
                        onTap: () {
                          selectedScore.value = score;
                        },
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
                      controller: infoController,
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
                      '$infoLen/100',
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

@immutable
class _InitialValues {
  final DateTime date;
  final String? friendName;
  final String? title;
  final String? info;
  final int? score;

  const _InitialValues({
    required this.date,
    required this.friendName,
    required this.title,
    required this.info,
    required this.score,
  });

  factory _InitialValues.from({
    required bool isEdit,
    required DateTime? date,
    required EventDetail? event,
  }) {
    if (isEdit) {
      final e = event!;
      return _InitialValues(
        date: DateTime.tryParse(e.eventDate) ?? DateTime.now(),
        friendName: '더미데이터',
        title: e.title,
        info: e.reviewText,
        score: e.reviewScore.toInt,
      );
    }
    final d = date ?? DateTime.now();
    return _InitialValues(
      date: DateTime(d.year, d.month, d.day),
      friendName: null,
      title: null,
      info: null,
      score: null,
    );
  }
}

@immutable
class _CurrentValues {
  final DateTime date;
  final String title;
  final String? friendName;
  final int? score;
  final String info;

  const _CurrentValues({
    required this.date,
    required this.title,
    required this.friendName,
    required this.score,
    required this.info,
  });
}

bool _canSubmit({
  required bool isEdit,
  required _InitialValues origin,
  required _CurrentValues current,
}) {
  final baseValid =
      current.title.trim().isNotEmpty &&
          (current.friendName?.trim().isNotEmpty ?? false);

  if (!baseValid) return false;

  if (!isEdit) return true;

  final hasChanged = !(
      DateUtils.isSameDay(current.date, origin.date) &&
          current.title.trim() == (origin.title ?? '').trim() &&
          (current.friendName ?? '').trim() == (origin.friendName ?? '').trim() &&
          (current.score ?? origin.score) == origin.score &&
          current.info.trim() == (origin.info ?? '').trim()
  );

  return hasChanged;
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/buttons/app_bar_done_button.dart';
import 'package:relog/core/presentation/widgets/buttons/picker_field.dart';
import 'package:relog/core/presentation/widgets/inputs/custom_text_field.dart';
import 'package:relog/core/presentation/widgets/picker/date_picker.dart';
import 'package:relog/core/utils/number_format.dart';
import 'package:relog/domain/gifts/enum/direction.dart';
import 'package:relog/domain/gifts/enum/gift_type.dart';
import 'package:relog/domain/gifts/gift_detail.dart';
import 'package:relog/presentation/gifts/widgets/selectable_chip_row.dart';

class GiftWriteScreen extends HookConsumerWidget {
  final bool isEdit;
  final String friendName;
  final GiftDetail? info;
  final Future<Map<String, dynamic>?> Function() onTapSearchFriend;

  const GiftWriteScreen({
    super.key,
    required this.isEdit,
    required this.friendName,
    this.info,
    required this.onTapSearchFriend,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFriendName = useState<String>(friendName);

    final selectedTag = useState<GiftType?>(
        isEdit ? info!.giftType : null
    );
    final selectedDirection = useState<Direction?>(
        isEdit ? info!.direction : null
    );

    final year = useState<int?>(
      null
        // isEdit ? info!.date.year : null
    );
    final month = useState<int?>(
      null
        // isEdit ? info!.date.month : null
    );
    final day = useState<int?>(
      null
        // isEdit ? info!.date.day : null
    );

    final priceController = useTextEditingController(
      text: isEdit ? NumberFormat('#,###').format(info!.price) : null,
    );
    useListenable(priceController);

    final infoController = useTextEditingController(
      text: isEdit ? info!.description : null,
    );
    useListenable(infoController);

    // 날짜 선택 picker call back
    final openPicker = useCallback(() async {
      final result = await showYmdPicker(
        context,
        initialYear: year.value ?? DateTime.now().year,
        initialMonth: month.value ?? DateTime.now().month,
        initialDay: day.value ?? DateTime.now().day,
      );
      if (result == null) return;

      year.value = result.year;
      month.value = result.month;
      day.value = result.day;
    }, [context, year.value, month.value, day.value]);

    // 등록 버튼 조건
    final isFriendValid = selectedFriendName.value.trim().isNotEmpty;
    final isTagValid = selectedTag.value != null;
    final isDirectionValid = selectedDirection.value != null;
    final isDateValid = year.value != null && month.value != null && day.value != null;

    final currentPrice = parsePrice(priceController.text);
    final isPriceValid = currentPrice != null;

    final isWriteEnabled =
        isFriendValid && isTagValid && isDirectionValid && isDateValid && isPriceValid;

    // 수정 버튼 조건
    final isDirty = !isEdit
      ? true
      : (
          selectedFriendName.value.trim() != friendName.trim() ||
          selectedTag.value != info!.giftType ||
          selectedDirection.value != info!.direction ||
          // year.value != info!.date.year ||
          // month.value != info!.date.month ||
          // day.value != info!.date.day ||
          currentPrice != info!.price ||
          infoController.text.trim() != (info!.description ?? '').trim()
        );

    final isEditEnabled = isWriteEnabled && isDirty;

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      appBar: DefaultAppBar(
        title: isEdit ? '선물 수정' : '선물 등록',
        defaultBackButtonIcon: false,
        trailing: AppBarDoneButton(
          enabled: isEdit ? isEditEnabled : isWriteEnabled,
          onTap: () {
            // TODO: 선물 등록 API || 선물 수정 API
          },
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 이름
                  _FieldLabel('친구 *'),
                  const SizedBox(height: 16,),

                  PickerField(
                    placeholder: '친구를 선택해 주세요',
                    valueText: selectedFriendName.value.isEmpty ? null : selectedFriendName.value,
                    onTap: () async {
                      final result = await onTapSearchFriend();
                      if (result == null) return;

                      final int friendId = result['id'];
                      final String friendName = result['name'];
                      selectedFriendName.value = friendName;
                    },
                  ),
                  const SizedBox(height: 24,),
              
                  // 선물 태그
                  _FieldLabel('선물 태그 *'),
                  const SizedBox(height: 16,),

                  SelectableChipRow(
                    items: GiftType.values,
                    selected: selectedTag.value,
                    labelBuilder: (t) => t.label,
                    onSelected: (t) => selectedTag.value = t,
                  ),
                  const SizedBox(height: 16,),

                  SelectableChipRow<Direction>(
                    items: Direction.values,
                    selected: selectedDirection.value,
                    labelBuilder: (d) => d.label,
                    onSelected: (d) => selectedDirection.value = d,
                  ),
                  const SizedBox(height: 24,),
              
                  // 날짜
                  _FieldLabel('일자 *'),
                  const SizedBox(height: 16,),

                  PickerField(
                    placeholder: '일자를 선택해 주세요',
                    valueText: (year.value != null && month.value != null && day.value != null)
                        ? '${year.value}년 ${month.value}월 ${day.value}일'
                        : null,
                    onTap: openPicker,
                  ),
                  const SizedBox(height: 24,),
              
                  // 가격
                  _FieldLabel('가격 *'),
                  const SizedBox(height: 16,),

                  CustomTextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    hintText: '선물 가격을 입력해 주세요',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      ThousandsSeparatorInputFormatter(),
                    ],
                  ),
                  const SizedBox(height: 24,),
              
                  // 설명
                  _FieldLabel('설명'),
                  const SizedBox(height: 16,),

                  CustomTextField(
                    controller: infoController,
                    hintText: '선물에 대한 간단한 설명을 입력해 주세요',
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
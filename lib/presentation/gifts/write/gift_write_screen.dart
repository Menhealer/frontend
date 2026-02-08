import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/buttons/app_bar_done_button.dart';
import 'package:relog/core/presentation/widgets/buttons/picker_field.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/presentation/widgets/inputs/custom_text_field.dart';
import 'package:relog/core/presentation/widgets/picker/date_picker.dart';
import 'package:relog/core/utils/number_format.dart';
import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/domain/gifts/enum/direction.dart';
import 'package:relog/domain/gifts/enum/gift_type.dart';
import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/presentation/gifts/providers/gifts_view_providers.dart';
import 'package:relog/presentation/gifts/widgets/selectable_chip_row.dart';

class GiftWriteScreen extends HookConsumerWidget {
  final bool isEdit;
  final Friend friend;
  final GiftDetail? giftInfo;
  final Future<Map<String, dynamic>?> Function() onTapSearchFriend;

  const GiftWriteScreen({
    super.key,
    required this.isEdit,
    required this.friend,
    this.giftInfo,
    required this.onTapSearchFriend,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(giftWriteViewModelProvider);
    final vm = ref.read(giftWriteViewModelProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        vm.initialize(isEdit: isEdit, gift: giftInfo, friend: friend);
      });
      return null;
    }, [isEdit, giftInfo?.id, friend.id]);

    final priceController = useTextEditingController();
    final descriptionController = useTextEditingController();

    useEffect(() {
      final formatted = state.price == null ? '' : NumberFormat('#,###').format(state.price);
      if (priceController.text != formatted) {
        priceController.text = formatted;
      }
      return null;
    }, [state.price]);

    useEffect(() {
      if (descriptionController.text != state.description) {
        descriptionController.text = state.description;
      }
      return null;
    }, [state.description]);

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
              title: '선물 등록',
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
        title: isEdit ? '선물 수정' : '선물 등록',
        defaultBackButtonIcon: false,
        trailing: AppBarDoneButton(
          enabled: state.canSubmit,
          onTap: () async {
            final result = await vm.submit();
            if (result != null && context.mounted) {
              print('변경 성공: ${result.toString()}');
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
                    valueText: state.friendName.isEmpty ? null : state.friendName,
                    onTap: () async {
                      final r = await onTapSearchFriend();
                      if (r != null) {
                        vm.onFriendSelected(r['id'], r['name']);
                      }
                    },
                  ),
                  const SizedBox(height: 24,),
              
                  // 선물 태그
                  _FieldLabel('선물 태그 *'),
                  const SizedBox(height: 16,),

                  SelectableChipRow(
                    items: GiftType.values,
                    selected: state.giftType,
                    labelBuilder: (t) => t.label,
                    onSelected: vm.onGiftTypeSelected,
                  ),
                  const SizedBox(height: 16,),

                  SelectableChipRow<Direction>(
                    items: Direction.values,
                    selected: state.direction,
                    labelBuilder: (d) => d.label,
                    onSelected: vm.onDirectionSelected,
                  ),
                  const SizedBox(height: 24,),
              
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
              
                  // 가격
                  _FieldLabel('가격 *'),
                  const SizedBox(height: 16,),

                  CustomTextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    hintText: '999,999,999원까지 입력 가능해요',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      ThousandsSeparatorInputFormatter(),
                    ],
                    onChanged: (v) => vm.onPriceChanged(parsePrice(v)),
                    maxLength: 11,
                  ),
                  const SizedBox(height: 24,),
              
                  // 설명
                  _FieldLabel('설명'),
                  const SizedBox(height: 16,),

                  CustomTextField(
                    controller: descriptionController,
                    hintText: '최대 20글자 입력 가능해요',
                    onChanged: vm.onDescriptionChanged,
                    maxLength: 20,
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
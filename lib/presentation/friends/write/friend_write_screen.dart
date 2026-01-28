import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/buttons/app_bar_done_button.dart';
import 'package:relog/core/presentation/widgets/inputs/custom_text_field.dart';
import 'package:relog/core/presentation/widgets/picker/birthday_picker.dart';
import 'package:relog/domain/friends/friend_edit.dart';

class FriendWriteScreen extends HookConsumerWidget {
  final bool isEdit;
  final FriendEdit? friendInfo;

  const FriendWriteScreen({
    super.key,
    required this.isEdit,
    this.friendInfo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController(
      text: isEdit ? friendInfo!.name : null,
    );
    useListenable(nameController);

    final groupController = useTextEditingController(
      text: isEdit ? friendInfo!.group : null,
    );
    useListenable(groupController);

    final month = useState<int?>(
      isEdit ? friendInfo!.birthday?.month : null
    );
    final day = useState<int?>(
      isEdit ? friendInfo!.birthday?.day : null
    );

    // 생일 선택 picker call back
    final openPicker = useCallback(() async {
      final result = await showBirthdayPicker(
        context,
        initialMonth: month.value ?? DateTime.now().month,
        initialDay: day.value ?? DateTime.now().day,
      );
      if (result == null) return;
      month.value = result.month;
      day.value = result.day;
    }, [context, month.value, day.value]);

    // 작성 버튼 활성화 조건
    final trimmedName = nameController.text.trim();
    final isWriteValid = trimmedName.isNotEmpty;

    // 수정 버튼 활성화 조건
    bool isEditValid = false;
    if (isEdit && friendInfo != null) {
      final isNameChanged = trimmedName != friendInfo!.name;
      final isNameValid = trimmedName.isNotEmpty;

      final currentGroup = groupController.text.trim();
      final originalGroup = friendInfo!.group?.trim() ?? '';
      final isGroupChanged = currentGroup != originalGroup;

      final isDirty = isNameChanged ||
          isGroupChanged ||
          month.value != friendInfo!.birthday?.month ||
          day.value != friendInfo!.birthday?.day;

      isEditValid = isDirty && isNameValid;
    }

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      appBar: DefaultAppBar(
        title: isEdit ? '친구 수정' : '친구 등록',
        defaultBackButtonIcon: false,
        trailing: AppBarDoneButton(
          enabled: isEdit ? isEditValid : isWriteValid,
          onTap: () {
            // TODO: 친구 등록 API || 친구 수정 API
          },
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 이름
                _FieldLabel('이름 *'),
                const SizedBox(height: 16,),
                CustomTextField(
                  controller: nameController,
                  hintText: '이름을 입력해 주세요',
                ),
                const SizedBox(height: 24,),

                // 단체
                _FieldLabel('단체'),
                const SizedBox(height: 16,),
                CustomTextField(
                  controller: groupController,
                  hintText: '단체를 입력해 주세요',
                ),
                const SizedBox(height: 24,),

                // 생일
                _FieldLabel('생일'),
                const SizedBox(height: 16,),
                GestureDetector(
                  onTap: openPicker,
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(minHeight: 44),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: ColorStyles.black2D,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 16,
                      children: [
                        Expanded(
                          child: Text(
                            (month.value == null || day.value == null)
                              ? '생일을 선택해 주세요'
                              : '${month.value}월 ${day.value}일',
                            style: TextStyles.normalTextRegular.copyWith(
                              color: (month.value == null || day.value == null)
                                ? ColorStyles.grayD3
                                : ColorStyles.white,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: ColorStyles.gray86,
                          size: 24,
                        )
                      ],
                    ),
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
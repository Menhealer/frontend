import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/buttons/app_bar_done_button.dart';
import 'package:relog/core/presentation/widgets/inputs/custom_text_field.dart';
import 'package:relog/core/presentation/widgets/picker/birthday_picker.dart';

class FriendWriteScreen extends HookConsumerWidget {
  const FriendWriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final groupController = useTextEditingController();

    final month = useState<int?>(null);
    final day = useState<int?>(null);


    // 생일 선택 picker call back
    final openPicker = useCallback(() async {
      final result = await showBirthdayPicker(
        context,
        initialMonth: DateTime.now().month,
        initialDay: DateTime.now().day,
      );
      if (result == null) return;
      month.value = result.month;
      day.value = result.day;
    }, [context, month.value, day.value]);

    // 작성 버튼 활성화 조건
    final trimmedNickname = nameController.text.trim();
    final isNicknameValid = trimmedNickname.isNotEmpty;

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      appBar: DefaultAppBar(
        title: '친구 등록',
        defaultBackButtonIcon: false,
        trailing: AppBarDoneButton(
          enabled: isNicknameValid,
          onTap: () {
            // TODO: 친구 등록 API
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
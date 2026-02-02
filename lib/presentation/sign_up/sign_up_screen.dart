import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/buttons/picker_field.dart';
import 'package:relog/core/presentation/widgets/inputs/custom_text_field.dart';
import 'package:relog/core/presentation/widgets/picker/birthday_picker.dart';

class SignUpScreen extends HookConsumerWidget {
  final VoidCallback onTapSignUp;

  const SignUpScreen({
    super.key,
    required this.onTapSignUp,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final emailController = useTextEditingController();
    final pwController = useTextEditingController();
    final pwCheckController = useTextEditingController();
    final nicknameController = useTextEditingController();

    final month = useState<int?>(null);
    final day = useState<int?>(null);

    final isEnabled = false;

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

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      appBar: DefaultAppBar(
        title: '회원가입',
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 이메일
                  _FieldLabel('이메일 *'),
                  const SizedBox(height: 16,),
                  Row(
                    spacing: 16,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: emailController,
                          hintText: '이메일을 입력해 주세요',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: 중복 확인
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          constraints: const BoxConstraints(minHeight: 44),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorStyles.grayD3,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '중복 확인',
                            style: TextStyles.smallTextBold.copyWith(
                              color: ColorStyles.black22,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40,),

                  // 비밀번호
                  _FieldLabel('비밀번호 *'),
                  const SizedBox(height: 16,),
                  CustomTextField(
                    controller: pwController,
                    hintText: '비밀번호 입력',
                  ),
                  const SizedBox(height: 16,),
                  CustomTextField(
                    controller: pwCheckController,
                    hintText: '비밀번호 확인',
                  ),
                  const SizedBox(height: 40,),

                  // 닉네임
                  _FieldLabel('닉네임 *'),
                  const SizedBox(height: 16,),
                  CustomTextField(
                    controller: nicknameController,
                    hintText: '닉네임을 입력해 주세요',
                  ),
                  const SizedBox(height: 40,),

                  // 생일
                  _FieldLabel('생일 *'),
                  const SizedBox(height: 16,),
                  PickerField(
                    placeholder: '생일을 선택해 주세요',
                    valueText: (month.value == null || day.value == null)
                        ? '생일을 선택해 주세요'
                        : '${month.value}월 ${day.value}일',
                    onTap: openPicker,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 56),
          child: ElevatedButton(
            onPressed: () => isEnabled ? {} : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isEnabled ? ColorStyles.black42 : ColorStyles.black2D,
              textStyle: TextStyles.largeTextBold,
              foregroundColor: isEnabled ? ColorStyles.white : ColorStyles.gray86,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: Text('가입하기'),
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
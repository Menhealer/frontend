import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/buttons/picker_field.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/presentation/widgets/inputs/custom_text_field.dart';
import 'package:relog/core/presentation/widgets/picker/date_picker.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/auth/model/login_request.dart';
import 'package:relog/presentation/sign_up/model/terms_agreement.dart';
import 'package:relog/presentation/sign_up/providers/sign_up_view_providers.dart';
import 'package:relog/presentation/sign_up/widgets/terms_agreement_bottom_sheet.dart';

class SignUpScreen extends HookConsumerWidget {
  final LoginRequest request;
  final VoidCallback onTapSignUp;
  final void Function(String url, String title) onTapWebView;

  const SignUpScreen({
    super.key,
    required this.request,
    required this.onTapSignUp,
    required this.onTapWebView,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signUpViewModelProvider);
    final vm = ref.read(signUpViewModelProvider.notifier);

    // 약관 동의
    final terms = useState<TermsAgreement>(const TermsAgreement());
    const service =
        'https://zircon-football-529.notion.site/2e73ee6f2561808bac63c705183b6645?v=2e73ee6f256180fbab70000c6e8862ec&source=copy_link';
    const privacy =
        'https://zircon-football-529.notion.site/2e73ee6f2561808bac63c705183b6645?v=2e73ee6f256180fbab70000c6e8862ec&source=copy_link';
    const marketing =
        'https://zircon-football-529.notion.site/2e73ee6f2561808bac63c705183b6645?v=2e73ee6f256180fbab70000c6e8862ec&source=copy_link';

    final openTermsBottomSheet = useCallback(() {
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.black.withValues(alpha: 0.55),
        isDismissible: false,
        enableDrag: false,
        builder: (_) => TermsAgreementBottomSheet(
          initial: terms.value,
          onChanged: (next) {
            terms.value = next;
          },
          onTapWebView: (type) {
            if (type == TermsAgreementType.service) {
              onTapWebView(service, '서비스 이용약관');
            } else if (type == TermsAgreementType.privacy) {
              onTapWebView(privacy, '개인정보 처리방침');
            } else if (type == TermsAgreementType.marketing) {
              onTapWebView(marketing, '광고성 정보 수신');
            }
          },
        ),
      );
    }, [context, terms.value]);


    final nicknameController = useTextEditingController();
    useListenable(nicknameController);

    final year = useState<int?>(null);
    final month = useState<int?>(null);
    final day = useState<int?>(null);

    // 생일 선택 picker call back
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

    final nicknameValid = nicknameController.text.trim().isNotEmpty;
    final isDirty = year.value != null &&
      month.value != null &&
      day.value != null;

    final isEnabled = nicknameValid && isDirty && terms.value.requiredAllChecked && !state.isLoading;

    // 오류
    useEffect(() {
      if (state.errorMessage != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showCupertinoDialog(
            context: context,
            barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
            builder: (_) => CustomDialog(
              title: '회원가입',
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
                  // 닉네임
                  _FieldLabel('닉네임 *'),
                  const SizedBox(height: 16,),
                  CustomTextField(
                    controller: nicknameController,
                    hintText: '최대 8글자 입력 가능해요',
                    maxLength: 8,
                  ),
                  const SizedBox(height: 40,),

                  // 생일
                  _FieldLabel('생일 *'),
                  const SizedBox(height: 16,),
                  PickerField(
                    placeholder: '생일을 선택해 주세요',
                    valueText: (year.value == null || month.value == null || day.value == null)
                        ? '생일을 선택해 주세요'
                        : '${year.value}년 ${month.value}월 ${day.value}일',
                    onTap: openPicker,
                  ),

                  const SizedBox(height: 40,),

                  // 약관 동의
                  _FieldLabel('약관 동의 *'),
                  const SizedBox(height: 16,),
                  PickerField(
                    placeholder: '약관에 동의해 주세요',
                    valueText: terms.value.requiredAllChecked
                        ? '필수 약관에 동의 했어요'
                        : '필수 약관에 동의해 주세요',
                    onTap: openTermsBottomSheet,
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
            onPressed: isEnabled
              ? () async {
                  final birthday = formatIntBirthday(year.value!, month.value!, day.value!);
                  final ok = await vm.signUp(request, nicknameController.text.trim(), birthday, terms.value.marketing);
                  if (ok) onTapSignUp();
                }
              : null,
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
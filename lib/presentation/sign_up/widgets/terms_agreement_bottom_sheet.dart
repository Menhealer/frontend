import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/presentation/sign_up/model/terms_agreement.dart';

class TermsAgreementBottomSheet extends HookWidget {
  final TermsAgreement initial;
  final void Function(TermsAgreementType type) onTapWebView;
  final void Function(TermsAgreement next) onChanged;

  const TermsAgreementBottomSheet({
    super.key,
    required this.initial,
    required this.onTapWebView,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final sel = useState<TermsAgreement>(initial);

    void close() {
      Navigator.of(context).pop();
    }

    // 전체 선택 여부
    final isAllChecked = sel.value.allChecked;

    void setAll(bool checked) {
      sel.value = sel.value.toggleAll(checked);
      onChanged(sel.value);
    }

    void setChecked({
      required bool service,
      required bool privacy,
      required bool marketing,
    }) {
      sel.value = sel.value.copyWith(
        service: service,
        privacy: privacy,
        marketing: marketing,
      );
      onChanged(sel.value);
    }

    Widget agreementTile({
      required bool value,
      required void Function(bool) onChangedCheckbox,
      required String label,
      required TermsAgreementType type,
    }) {
      return InkWell(
        onTap: () => onTapWebView(type),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: value,
              onChanged: (checked) => onChangedCheckbox(checked ?? false),
              activeColor: ColorStyles.grayD3,
              side: const BorderSide(
                width: 2,
                color: ColorStyles.gray86,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  label,
                  style: TextStyles.normalTextRegular.copyWith(
                    color: ColorStyles.grayD3,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: close,
              child: const SizedBox.expand(),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: false,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: const BoxDecoration(
                  color: ColorStyles.black2D,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '이용 약관',
                      style: TextStyles.largeTextBold.copyWith(
                        color: ColorStyles.grayD3,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: ColorStyles.black42),

                    // 전체 선택
                    Row(
                      children: [
                        Checkbox(
                          value: isAllChecked,
                          onChanged: (checked) => setAll(checked ?? false),
                          activeColor: ColorStyles.grayD3,
                          side: const BorderSide(
                            width: 2,
                            color: ColorStyles.gray86,
                          ),
                        ),
                        Text(
                          '전체 선택',
                          style: TextStyles.normalTextRegular.copyWith(
                            color: ColorStyles.grayD3,
                          ),
                        ),
                      ],
                    ),

                    const Divider(color: ColorStyles.black42),
                    const SizedBox(height: 8),

                    // 개별 약관
                    agreementTile(
                      value: sel.value.service,
                      onChangedCheckbox: (checked) {
                        setChecked(
                          service: checked,
                          privacy: sel.value.privacy,
                          marketing: sel.value.marketing,
                        );
                      },
                      label: '[필수] 이용약관 동의',
                      type: TermsAgreementType.service,
                    ),
                    agreementTile(
                      value: sel.value.privacy,
                      onChangedCheckbox: (checked) {
                        setChecked(
                          service: sel.value.service,
                          privacy: checked,
                          marketing: sel.value.marketing,
                        );
                      },
                      label: '[필수] 개인정보 수집 및 이용 동의',
                      type: TermsAgreementType.privacy,
                    ),

                    agreementTile(
                      value: sel.value.marketing,
                      onChangedCheckbox: (checked) {
                        setChecked(
                          service: sel.value.service,
                          privacy: sel.value.privacy,
                          marketing: checked,
                        );
                      },
                      label: '[선택] 마케팅 정보 수신 동의',
                      type: TermsAgreementType.marketing,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/inputs/custom_text_field.dart';

class SignInScreen extends HookConsumerWidget {
  final VoidCallback onTapSignIn;
  final VoidCallback onTapSignUp;

  const SignInScreen({
    super.key,
    required this.onTapSignIn,
    required this.onTapSignUp,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = '1234';
    final pw = '1234';

    final emailController = useTextEditingController();
    final pwController = useTextEditingController();

    bool signIn(String e, String p) {
      if (e != email || p != pw) {
        return false;
      }

      return true;
    };

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/logo.svg',
                            width: 128,
                            height: 128,
                          ),
                          Text(
                            'Relationship Log',
                            style: TextStyles.normalTextBold.copyWith(
                              color: ColorStyles.white,
                            ),
                          ),
                          const SizedBox(height: 48),

                          CustomTextField(
                            controller: emailController,
                            hintText: '이메일을 입력해 주세요',
                          ),
                          const SizedBox(height: 16),

                          CustomTextField(
                            controller: pwController,
                            hintText: '비밀번호를 입력해 주세요',
                            obscureText: true,
                          ),
                          const SizedBox(height: 24),

                          _PrimaryButton(
                            text: '로그인',
                            onTap: () {
                              final result = signIn(emailController.text.trim(), pwController.text.trim());
                              if (!result) return;
                              onTapSignIn();
                            },
                          ),
                          const SizedBox(height: 24),

                          _OutlineButton(
                            text: '회원가입',
                            onTap: onTapSignUp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _PrimaryButton({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 44),
        decoration: BoxDecoration(
          color: ColorStyles.grayD3,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyles.normalTextBold.copyWith(
            color: ColorStyles.black22,
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _OutlineButton({
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 44),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorStyles.gray86),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyles.normalTextBold.copyWith(
            color: ColorStyles.grayD3,
          ),
        ),
      ),
    );
  }
}
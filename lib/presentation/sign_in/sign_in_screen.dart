import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/domain/auth/enum/login_entry.dart';
import 'package:relog/domain/auth/enum/login_platform.dart';
import 'package:relog/domain/auth/model/login_request.dart';
import 'package:relog/domain/auth/use_case/result/social_login_result.dart';
import 'package:relog/presentation/sign_in/providers/sign_in_view_providers.dart';

class SignInScreen extends HookConsumerWidget {
  final void Function(LoginRequest requset) onTapSignUp;
  final VoidCallback onTapSignIn;

  const SignInScreen({
    super.key,
    required this.onTapSignIn,
    required this.onTapSignUp,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signInViewModelProvider);
    final vm = ref.read(signInViewModelProvider.notifier);

    // 오류
    useEffect(() {
      if (state.errorMessage != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showCupertinoDialog(
            context: context,
            barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
            builder: (_) => CustomDialog(
              title: '로그인 오류',
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

                          _ImageButton(
                            platform: LoginPlatform.KAKAO,
                            img: 'assets/images/kakao_login.png',
                            onTap: () async {
                              KakaoLoginFlow.entry = LoginEntry.signIn;
                              final result = await vm.socialLogin(LoginPlatform.KAKAO);

                              switch (result) {
                                case SocialLoginSuccess():
                                  onTapSignIn();
                                case SocialLoginNeedSignUp(:final platform, :final token):
                                  onTapSignUp(LoginRequest(provider: platform, token: token));
                                case SocialLoginCanceled():
                                  break;
                              }
                            },
                          ),
                          const SizedBox(height: 16),

                          if (Platform.isIOS)
                            _ImageButton(
                              platform: LoginPlatform.APPLE,
                              img: 'assets/images/apple_login.png',
                              onTap: () async {
                                final result = await vm.socialLogin(LoginPlatform.APPLE);

                                switch (result) {
                                  case SocialLoginSuccess():
                                    onTapSignIn();
                                  case SocialLoginNeedSignUp(:final platform, :final token):
                                    onTapSignUp(LoginRequest(provider: platform, token: token));
                                  case SocialLoginCanceled():
                                    break;
                                }
                              },
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

class _ImageButton extends StatelessWidget {
  final LoginPlatform platform;
  final String img;
  final VoidCallback onTap;

  const _ImageButton({
    required this.platform,
    required this.img,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxHeight: 44),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: platform == LoginPlatform.KAKAO
            ? const Color(0xFFFEE500)
            : const Color(0xFFFFFFFF),
        ),
        child: Image.asset(
          img,
          width: double.infinity,
        ),
      ),
    );
  }
}
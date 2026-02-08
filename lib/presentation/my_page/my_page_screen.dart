import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/storage/providers/user_session_provider.dart';
import 'package:relog/domain/auth/enum/login_entry.dart';
import 'package:relog/domain/auth/enum/login_platform.dart';
import 'package:relog/presentation/my_page/providers/my_page_view_providers.dart';
import 'package:relog/presentation/my_page/widgets/profile_card.dart';
import 'package:relog/presentation/my_page/widgets/setting_section.dart';

class MyPageScreen extends HookConsumerWidget {
  final VoidCallback onTapEditScreen;
  final void Function(String url, String title) onTapWebView;

  const MyPageScreen({
    super.key,
    required this.onTapEditScreen,
    required this.onTapWebView,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 사용자 정보
    final userAsync = ref.watch(userSessionProvider);
    final user = userAsync.asData?.value;

    final state = ref.watch(myPageViewModelProvider);
    final vm = ref.read(myPageViewModelProvider.notifier);

    const termsOfService =
        'https://zircon-football-529.notion.site/2e73ee6f2561808bac63c705183b6645?v=2e73ee6f256180fbab70000c6e8862ec&source=copy_link';
    const privacyPolicy =
        'https://zircon-football-529.notion.site/2e73ee6f2561808bac63c705183b6645?v=2e73ee6f256180fbab70000c6e8862ec&source=copy_link';

    // 오류
    useEffect(() {
      if (state.errorMessage != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showCupertinoDialog(
            context: context,
            barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
            builder: (_) => CustomDialog(
              title: '마이페이지 오류',
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
    // 로그아웃 직후/세션 로딩 중 보호
    if (user == null) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24,
              children: [
                Text(
                  'My Log',
                  style: TextStyles.titleTextBold.copyWith(
                    color: ColorStyles.grayD3,
                  ),
                ),

                // 프로필 카드
                MyProfileCard(
                  name: user.nickname,
                  provider: user.provider.toLoginPlatform(),
                  imageUrl: user.profileImage,
                  onEditProfile: onTapEditScreen,
                ),

                // 설정
                SettingsSectionCard(
                  title: '앱 정보',
                  children: [
                    const SettingsItem(label: '버전  1.0.0'),
                    SettingsItem(
                      label: '서비스 이용약관',
                      onTap: () => onTapWebView(termsOfService, '서비스 이용약관'),
                    ),
                    SettingsItem(
                      label: '개인정보 처리방침',
                      onTap: () => onTapWebView(privacyPolicy, '개인정보 처리방침'),
                    ),
                  ],
                ),

                SettingsSectionCard(
                  title: '계정 관리',
                  children: [
                    SettingsItem(
                      label: '로그아웃',
                      onTap: () async {
                        showCupertinoDialog(
                          context: context,
                          barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
                          builder: (_) => CustomDialog(
                            title: '로그아웃',
                            content: '로그아웃 하시겠어요?',
                            actions: [
                              CustomDialogAction(
                                text: '취소',
                                style: DialogActionStyle.destructive,
                                onPressed: () {},
                              ),
                              CustomDialogAction(
                                text: '확인',
                                style: DialogActionStyle.normal,
                                isDefaultAction: true,
                                onPressed: () async {
                                  await vm.logout();
                                },
                              ),
                            ],
                          ),
                        );
                        // 삭제 로직
                      },
                    ),
                    SettingsItem(
                      label: '회원 탈퇴',
                      onTap: () {
                        // TODO: 회원 탈퇴 로직
                        KakaoLoginFlow.entry = LoginEntry.mypage;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
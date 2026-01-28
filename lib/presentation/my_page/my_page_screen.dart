import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
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
    const termsOfService =
        'https://zircon-football-529.notion.site/2e73ee6f2561808bac63c705183b6645?v=2e73ee6f256180fbab70000c6e8862ec&source=copy_link';
    const privacyPolicy =
        'https://zircon-football-529.notion.site/2e73ee6f2561808bac63c705183b6645?v=2e73ee6f256180fbab70000c6e8862ec&source=copy_link';

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
                  name: '주꾸미',
                  email: 'woojoo0922@gmail.com',
                  imageAsset: 'assets/images/profile.png',
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
                      onTap: () {
                        // TODO: 로그아웃 로직
                      },
                    ),
                    SettingsItem(
                      label: '회원 탈퇴',
                      onTap: () {
                        // TODO: 회원 탈퇴 로직
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
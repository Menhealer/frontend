import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/buttons/secondary_button.dart';
import 'package:relog/domain/auth/enum/login_platform.dart';

class MyProfileCard extends StatelessWidget {
  final String name;
  final LoginPlatform provider;
  final String? imageUrl;
  final VoidCallback onEditProfile;

  const MyProfileCard({
    super.key,
    required this.name,
    required this.provider,
    this.imageUrl,
    required this.onEditProfile,
  });

  static const _avatarSize = 44.0;
  static const _fallbackAsset = 'assets/images/profile.png';

  bool get _hasValidUrl {
    final url = imageUrl?.trim();
    if (url == null || url.isEmpty) return false;
    return url.startsWith('http://') || url.startsWith('https://');
  }

  Widget _buildAvatar() {
    if (_hasValidUrl) {
      return Image.network(
        imageUrl!.trim(),
        width: _avatarSize,
        height: _avatarSize,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return SizedBox(
            width: _avatarSize,
            height: _avatarSize,
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (_, __, ___) => Image.asset(
          _fallbackAsset,
          width: _avatarSize,
          height: _avatarSize,
          fit: BoxFit.cover,
        ),
      );
    }

    return Image.asset(
      _fallbackAsset,
      width: _avatarSize,
      height: _avatarSize,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: BoxDecoration(
        color: ColorStyles.black2D,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(child: _buildAvatar()),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyles.largeTextBold.copyWith(
                        color: ColorStyles.grayD3,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${provider.label} 계정으로 로그인 되었습니다.',
                      style: TextStyles.smallTextRegular.copyWith(
                        color: ColorStyles.gray86,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SecondaryButton(
            label: '프로필 수정',
            minHeight: 40,
            onTap: onEditProfile,
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/buttons/secondary_button.dart';

class MyProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String imageAsset;
  final VoidCallback onEditProfile;

  const MyProfileCard({
    super.key,
    required this.name,
    required this.email,
    required this.imageAsset,
    required this.onEditProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorStyles.black2D,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              ClipOval(
                child: Image.asset(
                  imageAsset,
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    name,
                    style: TextStyles.largeTextBold.copyWith(
                      color: ColorStyles.grayD3,
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyles.smallTextRegular.copyWith(
                      color: ColorStyles.gray86,
                    ),
                  ),
                ],
              ),
            ],
          ),
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
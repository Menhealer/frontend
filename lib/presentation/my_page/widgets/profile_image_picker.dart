import 'package:flutter/material.dart';
import 'dart:io';
import 'package:relog/core/presentation/styles/color_styles.dart';

class ProfileImagePicker extends StatelessWidget {
  final String? imageUrl;
  final String imageAsset;
  final File? imageFile;
  final double size;
  final VoidCallback onTap;

  const ProfileImagePicker({
    super.key,
    this.imageUrl,
    required this.imageAsset,
    this.imageFile,
    this.size = 64,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget image;

    if (imageFile != null) {
      image = Image.file(
        imageFile!,
        width: size,
        height: size,
        fit: BoxFit.cover,
      );
    } else if (imageUrl != null && imageUrl!.isNotEmpty && imageUrl != '') {
      image = Image.network(
        imageUrl!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return SizedBox(
            width: size,
            height: size,
            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        },
        errorBuilder: (_, __, ___) => Image.asset(
          imageAsset,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      );
    } else {
      image = Image.asset(
        imageAsset,
        width: size,
        height: size,
        fit: BoxFit.cover,
      );
    }

    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // 프로필 이미지
            ClipOval(child: image),

            // 카메라 아이콘
            Positioned(
              bottom: -2,
              right: -2,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: ColorStyles.black42,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
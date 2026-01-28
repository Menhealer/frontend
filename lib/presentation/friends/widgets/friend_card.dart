import 'package:flutter/material.dart';
import 'package:relog/core/presentation/ui/color_styles.dart';
import 'package:relog/core/presentation/ui/text_styles.dart';
import 'package:relog/domain/friends/friend.dart';

class FriendCard extends StatelessWidget {
  final Friend friend;

  const FriendCard({
    super.key,
    required this.friend,
  });

  @override
  Widget build(BuildContext context) {
    final clampedScore = friend.score.clamp(-100, 100);
    final percent = clampedScore.abs() / 100;

    final barColor = clampedScore >= 0
        ? ColorStyles.green100
        : ColorStyles.red100;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 48),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          Expanded(
            child: Text(
              friend.name,
              style: TextStyles.largeTextBold.copyWith(
                color: ColorStyles.grayD3,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final maxWidth = 128.0;

                return Stack(
                  children: [
                    Container(
                      height: 8,
                      width: maxWidth,
                      color: ColorStyles.black42,
                    ),

                    // 채워진 바
                    Container(
                      height: 8,
                      width: maxWidth * percent,
                      color: barColor,
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
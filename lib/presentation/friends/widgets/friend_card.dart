import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/presentation/friends/widgets/score_bar.dart';

class FriendCard extends StatelessWidget {
  final Friend friend;
  final bool showScore;

  const FriendCard({
    super.key,
    required this.friend,
    this.showScore = true,
  });

  @override
  Widget build(BuildContext context) {
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
          if (showScore)
            SizedBox(
              width: 128,
              child: ScoreBar(
                score: friend.score,
                height: 8,
              ),
            ),
        ],
      ),
    );
  }
}
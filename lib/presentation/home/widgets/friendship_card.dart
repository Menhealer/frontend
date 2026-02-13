import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/chip/info_chip.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/home/model/friend_info.dart';

class FriendshipCard extends StatelessWidget {
  final FriendInfo item;
  final VoidCallback onTap;

  const FriendshipCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        decoration: BoxDecoration(
          color: ColorStyles.black2D,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    item.friend.name,
                    style: TextStyles.largeTextBold.copyWith(
                      color: ColorStyles.grayD3,
                    ),
                  ),
                  Text(
                    item.recommendation,
                    style: TextStyles.normalTextRegular.copyWith(
                      color: ColorStyles.grayD3,
                    ),
                  ),
                ],
              ),
            ),

            if (item.friend.group != null && item.friend.group != '') ...[
              InfoChip(
                label: item.friend.group!,
                backgroundColor: ColorStyles.purple100,
                textColor: ColorStyles.purple10,
              ),
            ],

            if (item.friend.birthday != null)
              InfoChip(
                label: formatBirthday(item.friend.birthday!),
                backgroundColor: ColorStyles.pink100,
                textColor: ColorStyles.pink10,
              ),
          ],
        ),
      ),
    );
  }
}
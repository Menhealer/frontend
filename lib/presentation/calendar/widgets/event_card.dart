import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/utils/color_mapping.dart';
import 'package:relog/domain/calendar.dart';

class EventCard extends StatelessWidget {
  final Calendar event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      constraints: const BoxConstraints(minHeight: 44),
      decoration: BoxDecoration(
        color: ColorStyles.black2D,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  spacing: 16,
                  children: [
                    Text(
                      event.friendName,
                      style: TextStyles.normalTextBold.copyWith(
                        color: ColorStyles.grayD3,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 14,
                      color: ColorStyles.gray86,
                    ),
                    Text(
                      event.title,
                      style: TextStyles.normalTextRegular.copyWith(
                        color: ColorStyles.grayD3,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: scoreToColor(event.score),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          if (event.category == 'birthday' && event.info != null && event.info!.isNotEmpty)
            Text(
              '기록 - ${event.info}',
              style: TextStyles.smallTextRegular.copyWith(
                color: ColorStyles.grayA3,
              ),
            ),
        ],
      ),
    );
  }
}
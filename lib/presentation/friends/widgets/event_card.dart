import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/utils/review_mapping.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/events/enum/review_score.dart';
import 'package:relog/domain/events/model/event.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 48),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: ColorStyles.black37,
          borderRadius: BorderRadius.circular(8),
        ),
      child: Row(
        spacing: 8,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  formatPeriodDate(event.eventDate),
                  style: TextStyles.smallTextRegular.copyWith(
                    color: ColorStyles.grayA3,
                  ),
                ),
                Text(
                  event.title,
                  style: TextStyles.normalTextBold.copyWith(
                    color: ColorStyles.grayD3,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: scoreToColor(event.reviewScore.toInt),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
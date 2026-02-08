import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/utils/number_format.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/gifts/enum/direction.dart';
import 'package:relog/domain/gifts/enum/gift_type.dart';
import 'package:relog/domain/gifts/model/gift_detail.dart';

class GiftsCard extends StatelessWidget {
  final String nickname;
  final GiftDetail gift;

  const GiftsCard({
    super.key,
    required this.nickname,
    required this.gift,
  });

  @override
  Widget build(BuildContext context) {
    final barColor = gift.direction == Direction.GIVEN
        ? ColorStyles.red100
        : ColorStyles.green100;

    final descriptionText = gift.direction == Direction.GIVEN
        ? '$nickname님이 준 선물이에요'
        : '$nickname님이 받은 선물이에요';

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 48),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ColorStyles.black37,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 8,
              decoration: BoxDecoration(
                color: barColor,
              ),
            ),
        
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    // 태그 + 날짜
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            gift.giftType.label,
                            style: TextStyles.smallTextBold.copyWith(
                              color: ColorStyles.grayD3,
                            ),
                          ),
                        ),
                        Text(
                          formatPeriodDate(gift.giftDate),
                          style: TextStyles.smallTextRegular.copyWith(
                            color: ColorStyles.grayA3,
                          ),
                        ),
                      ],
                    ),
        
                    // 금액 + 부가 정보
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      spacing: 8,
                      children: [
                        Text(
                          '${NumberFormatUtil.comma(gift.price)}원',
                          style: TextStyles.largeTextBold.copyWith(
                            color: ColorStyles.grayD3,
                          ),
                        ),
                        if (gift.description != null) ...[
                          Text(
                            gift.description!,
                            style: TextStyles.smallTextRegular.copyWith(
                              color: ColorStyles.grayA3,
                            ),
                          ),
                        ],
                      ],
                    ),
        
                    // 줬냐 / 받았냐
                    Text(
                      descriptionText,
                      style: TextStyles.smallTextRegular.copyWith(
                        color: ColorStyles.grayD3,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
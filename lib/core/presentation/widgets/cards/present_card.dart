import 'package:flutter/material.dart';
import 'package:relog/core/presentation/ui/color_styles.dart';
import 'package:relog/core/presentation/ui/text_styles.dart';
import 'package:relog/core/utils/number_format.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/friends/present.dart';

class PresentCard extends StatelessWidget {
  final String nickname;
  final Present present;

  const PresentCard({
    super.key,
    required this.nickname,
    required this.present,
  });

  @override
  Widget build(BuildContext context) {
    final barColor = present.isGive
        ? ColorStyles.red100
        : ColorStyles.green100;

    final descriptionText = present.isGive
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
                            present.tag,
                            style: TextStyles.smallTextBold.copyWith(
                              color: ColorStyles.grayD3,
                            ),
                          ),
                        ),
                        Text(
                          formatPeriodDate(present.date),
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
                          '${NumberFormatUtil.comma(present.price)}원',
                          style: TextStyles.largeTextBold.copyWith(
                            color: ColorStyles.grayD3,
                          ),
                        ),
                        if (present.info != null) ...[
                          Text(
                            present.info!,
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
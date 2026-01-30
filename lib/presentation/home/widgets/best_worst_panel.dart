import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

class BestWorstPanel extends StatelessWidget {
  final String bestName;
  final String worstName;
  final VoidCallback onTap;

  const BestWorstPanel({super.key,
    required this.bestName,
    required this.worstName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget chipBox({
      required String title,
      required Color titleColor,
      required String name,
    }) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: ColorStyles.black37,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyles.largeTextBold.copyWith(color: titleColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.smallTextBold.copyWith(
                    color: ColorStyles.grayD3,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Row(
            children: [
              chipBox(
                title: '🏆 Best',
                titleColor: ColorStyles.green100,
                name: bestName,
              ),
              const SizedBox(width: 8),
              chipBox(
                title: '⚠️ Worst',
                titleColor: ColorStyles.red100,
                name: worstName,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '더보기',
                style: TextStyles.smallTextRegular.copyWith(
                  color: ColorStyles.grayD3,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.navigate_next, color: ColorStyles.grayD3, size: 16),
            ],
          ),
        ],
      ),
    );
  }
}
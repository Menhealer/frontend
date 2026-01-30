import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

class FriendshipTabBar extends StatelessWidget {
  const FriendshipTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorStyles.black42, width: 1),
        ),
      ),
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: ColorStyles.grayD3,
        indicatorWeight: 2,
        dividerColor: Colors.transparent,
        labelColor: ColorStyles.grayD3,
        unselectedLabelColor: ColorStyles.gray86,
        labelStyle: TextStyles.largeTextBold,
        unselectedLabelStyle: TextStyles.largeTextRegular,
        tabs: const [
          Tab(text: '베스트'),
          Tab(text: '워스트'),
        ],
      ),
    );
  }
}
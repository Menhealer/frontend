import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';

class BottomNavigation extends StatelessWidget {
  final Widget body;
  final int currentPageIndex;
  final void Function(int index) onChangeIndex;

  const BottomNavigation({
    super.key,
    required this.body,
    required this.currentPageIndex,
    required this.onChangeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorStyles.white,
          boxShadow: [
            BoxShadow(
              color: ColorStyles.white,
              offset: const Offset(0, -1),
              blurRadius: 4,
              spreadRadius: -4,
            ),
          ],
        ),
        // padding: const EdgeInsets.only(top: 2, bottom: 10),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            navigationBarTheme: NavigationBarThemeData(
              backgroundColor: ColorStyles.black22,
              indicatorColor: Colors.transparent,
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
                final isSelected = states.contains(WidgetState.selected);
                return TextStyles.smallTextRegular.copyWith(
                  color: isSelected ? ColorStyles.white : ColorStyles.gray86,
                );
              }),
            ),
          ),
          child: NavigationBar(
            height: 64,
            indicatorColor: Colors.transparent,
            onDestinationSelected: onChangeIndex,
            selectedIndex: currentPageIndex,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_filled, color: ColorStyles.gray86,),
                selectedIcon: Icon(Icons.home_filled, color: ColorStyles.white,),
                label: '정산',
              ),
              NavigationDestination(
                icon: Icon(Icons.grid_view_outlined, color: ColorStyles.gray86,),
                selectedIcon: Icon(Icons.grid_view_outlined, color: ColorStyles.white,),
                label: '일정',
              ),
              NavigationDestination(
                icon: Icon(Icons.chat_bubble_outline, color: ColorStyles.gray86,),
                selectedIcon: Icon(Icons.chat_bubble_outline, color: ColorStyles.white,),
                label: '친구',
              ),
              NavigationDestination(
                icon: Icon(Icons.person, color: ColorStyles.gray86,),
                selectedIcon: Icon(Icons.person, color: ColorStyles.white,),
                label: '마이페이지',
              )
            ],
          ),
        ),
      ),
    );
  }
}
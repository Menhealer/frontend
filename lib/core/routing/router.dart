import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:relog/core/routing/route_paths.dart';
import 'package:relog/presentation/calendar/calendar_screen.dart';
import 'package:relog/presentation/friends/friends_screen.dart';
import 'package:relog/presentation/home/home_screen.dart';
import 'package:relog/presentation/my_page/edit/profile_edit_screen.dart';
import 'package:relog/presentation/my_page/my_page_screen.dart';
import 'package:relog/presentation/navigation/bottom_navigation.dart';
import 'package:relog/presentation/web_view/web_view_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: RoutePaths.home,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
       return BottomNavigation(
         body: navigationShell,
         currentPageIndex: navigationShell.currentIndex,
         onChangeIndex: (index) {
           navigationShell.goBranch(
             index,
             initialLocation:  index == navigationShell.currentIndex,
           );
         },
       );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.home,
              builder: (context, state) => HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.calendar,
              builder: (context, state) => CalendarScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.friends,
              builder: (context, state) => FriendsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.mypage,
              builder: (context, state) => MyPageScreen(
                onTapEditScreen: () {
                  context.push(RoutePaths.mypage + RoutePaths.profileEdit);
                },
                onTapWebView: (url, title) {
                  context.push(
                    RoutePaths.mypage + RoutePaths.webView,
                    extra: {
                      'url': url,
                      'title': title,
                    },
                  );
                },
              ),
              routes: [
                GoRoute(
                  path: RoutePaths.profileEdit,
                  builder: (context, state) => ProfileEditScreen(),
                ),
                GoRoute(
                  path: RoutePaths.webView,
                  builder: (context, state) {
                    return WebViewScreen(
                      url: (state.extra as Map<String, dynamic>)['url'],
                      title: (state.extra as Map<String, dynamic>)['title'],
                    );
                  }
                ),
              ]
            ),
          ],
        ),
      ]
    )
  ]
);
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:relog/core/routing/route_paths.dart';
import 'package:relog/domain/friends/friend_detail.dart';
import 'package:relog/domain/friends/friend_edit.dart';
import 'package:relog/domain/presents/present_friend.dart';
import 'package:relog/presentation/calendar/calendar_screen.dart';
import 'package:relog/presentation/friends/detail/friend_detail_screen.dart';
import 'package:relog/presentation/friends/friends_screen.dart';
import 'package:relog/presentation/friends/summary/friend_summary.dart';
import 'package:relog/presentation/friends/write/friend_write_screen.dart';
import 'package:relog/presentation/home/home_screen.dart';
import 'package:relog/presentation/my_page/edit/profile_edit_screen.dart';
import 'package:relog/presentation/my_page/my_page_screen.dart';
import 'package:relog/presentation/navigation/bottom_navigation.dart';
import 'package:relog/presentation/presents/presents_screen.dart';
import 'package:relog/presentation/web_view/web_view_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: RoutePaths.home,
  routes: [
    GoRoute(
      path: RoutePaths.presents,
      builder: (context, state) {
        final info = state.extra as PresentFriend;
        return PresentsScreen(
          info: info,
          onTapWrite: (isEdit) {  },
        );
      },
    ),
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
              builder: (context, state) => FriendsScreen(
                onTapDetail: (detail) {
                  context.push(
                    RoutePaths.friends + RoutePaths.friendDetail,
                    extra: detail,
                  );
                },
                onTapWrite: (isEdit) {
                  context.push(
                    RoutePaths.friends + RoutePaths.friendWrite,
                    extra: {
                      'isEdit': false,
                      'friendInfo': null,
                    },
                  );
                },
              ),
              routes: [
                GoRoute(
                  path: RoutePaths.friendWrite,
                  builder: (context, state) {
                    final extra = state.extra as Map<String, dynamic>?;
                    final bool isEdit = extra?['isEdit'] ?? false;
                    final FriendEdit? friendInfo = extra?['friendInfo'] as FriendEdit?;

                    return FriendWriteScreen(
                      isEdit: isEdit,
                      friendInfo: friendInfo,
                    );
                  },
                ),
                GoRoute(
                  path: RoutePaths.friendDetail,
                  builder: (context, state) {
                    final detail = state.extra as FriendDetail;
                    return FriendDetailScreen(
                      friend: detail,
                      onTapSummary: () {
                        context.push(
                          RoutePaths.friends + RoutePaths.friendDetail + RoutePaths.friendSummary,
                        );
                      },
                      onTapPresent: (info) {
                        context.push(
                          RoutePaths.presents,
                          extra: info,
                        );
                      },
                      onTapEdit: (isEdit, friendInfo) {
                        context.push(
                          RoutePaths.friends + RoutePaths.friendWrite,
                          extra: {
                            'isEdit': isEdit,
                            'friendInfo': friendInfo,
                          },
                        );
                      },
                    );
                  },
                  routes: [
                    GoRoute(
                      path: RoutePaths.friendSummary,
                      builder: (context, state) => FriendSummary(),
                    )
                  ]
                ),
              ]
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
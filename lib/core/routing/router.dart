import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:relog/core/routing/route_paths.dart';
import 'package:relog/domain/event.dart';
import 'package:relog/domain/friends/friend_edit.dart';
import 'package:relog/domain/presents/present.dart';
import 'package:relog/presentation/calendar/calendar_screen.dart';
import 'package:relog/presentation/calendar/detail/calendar_detail_screen.dart';
import 'package:relog/presentation/calendar/write/calendar_write_screen.dart';
import 'package:relog/presentation/friends/detail/friend_detail_screen.dart';
import 'package:relog/presentation/friends/friends_screen.dart';
import 'package:relog/presentation/friends/selete/select_friend_screen.dart';
import 'package:relog/presentation/friends/summary/friend_summary.dart';
import 'package:relog/presentation/friends/write/friend_write_screen.dart';
import 'package:relog/presentation/home/friendship/friendship_screen.dart';
import 'package:relog/presentation/home/home_screen.dart';
import 'package:relog/presentation/my_page/edit/profile_edit_screen.dart';
import 'package:relog/presentation/my_page/my_page_screen.dart';
import 'package:relog/presentation/navigation/bottom_navigation.dart';
import 'package:relog/presentation/presents/presents_screen.dart';
import 'package:relog/presentation/presents/write/present_write_screen.dart';
import 'package:relog/presentation/web_view/web_view_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: RoutePaths.home,
  routes: [
    // 선물
    GoRoute(
      path: RoutePaths.presents,
      builder: (context, state) {
        final id = state.extra as int;
        return PresentsScreen(
          id: id,
          onTapWrite: (isEdit, friendName) {
            context.push(
              RoutePaths.presents + RoutePaths.presentWrite,
              extra: {
                'isEdit': isEdit,
                'friendName': friendName,
              },
            );
          },
          onTapEdit: (isEdit, friendName, present) {
            context.push(
              RoutePaths.presents + RoutePaths.presentWrite,
              extra: {
                'isEdit': isEdit,
                'friendName': friendName,
                'info' : present,
              },
            );
          },
        );
      },
      routes: [
        GoRoute(
          path: RoutePaths.presentWrite,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            final bool isEdit = extra?['isEdit'] ?? false;
            final String friendName = extra?['friendName'] ?? '';
            final Present? info = extra?['info'] as Present?;

            return PresentWriteScreen(
              isEdit: isEdit,
              friendName: friendName,
              info: info,
              onTapSearchFriend: () async {
                final result = await context.push<String>(
                  RoutePaths.selectFriend,
                );
                return result;
              },
            );
          },
        ),
      ]
    ),

    // 친구 선택
    GoRoute(
      path: RoutePaths.selectFriend,
      builder: (context, state) => SelectFriendScreen(),
    ),

    // 탭
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
              builder: (context, state) => HomeScreen(
                onTapFriendship: () {
                  context.push(
                    RoutePaths.home + RoutePaths.friendship,
                  );
                },
              ),
              routes: [
                GoRoute(
                  path: RoutePaths.friendship,
                  builder: (context, state) => FriendshipScreen(
                    onTapFriendDetail: (id) {
                      context.push(
                        RoutePaths.friends + RoutePaths.friendDetail,
                        extra: id,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.calendar,
              builder: (context, state) => CalendarScreen(
                onTapWrite: (isEdit, date) {
                  context.push(
                    RoutePaths.calendar + RoutePaths.calendarWrite,
                    extra: {
                      'isEdit': isEdit,
                      'date': date,
                    },
                  );
                },
                onTapPresent: (id) {
                  context.push(
                    RoutePaths.presents,
                    extra: id,
                  );
                },
                onTapEventDetail: (id) {
                  context.push(
                    RoutePaths.calendar + RoutePaths.calendarDetail,
                    extra: id,
                  );
                },
              ),
              routes: [
                GoRoute(
                  path: RoutePaths.calendarWrite,
                  builder: (context, state) {
                    final extra = state.extra as Map<String, dynamic>?;
                    final bool isEdit = extra?['isEdit'] ?? false;
                    final DateTime? date = extra?['date'] as DateTime?;
                    final Event? event = extra?['event'] as Event?;

                    return CalendarWriteScreen(
                      isEdit: isEdit,
                      date: date,
                      event: event,
                      onTapSearchFriend: () async {
                        final result = await context.push<String>(
                          RoutePaths.selectFriend,
                        );
                        return result;
                      },
                    );
                  },
                ),
                GoRoute(
                  path: RoutePaths.calendarDetail,
                  builder: (context, state) {
                    final id = state.extra as int;

                    return CalendarDetailScreen(
                      id: id,
                      onTapEdit: (isEdit, event) {
                        context.push(
                          RoutePaths.calendar + RoutePaths.calendarWrite,
                          extra: {
                            'isEdit': isEdit,
                            'event': event,
                          },
                        );
                      },
                    );
                  },
                ),
              ]
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RoutePaths.friends,
              builder: (context, state) => FriendsScreen(
                onTapDetail: (id) {
                  context.push(
                    RoutePaths.friends + RoutePaths.friendDetail,
                    extra: id,
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
                    final id = state.extra as int;
                    return FriendDetailScreen(
                      id: id,
                      onTapSummary: () {
                        context.push(
                          RoutePaths.friends + RoutePaths.friendDetail + RoutePaths.friendSummary,
                        );
                      },
                      onTapPresent: (id) {
                        context.push(
                          RoutePaths.presents,
                          extra: id,
                        );
                      },
                      onTapEventDetail: (id) {
                        context.push(
                          RoutePaths.calendar + RoutePaths.calendarDetail,
                          extra: id,
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
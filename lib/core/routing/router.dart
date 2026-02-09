import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/routing/route_paths.dart';
import 'package:relog/core/storage/providers/user_session_provider.dart';
import 'package:relog/domain/auth/enum/login_entry.dart';
import 'package:relog/domain/auth/model/login_request.dart';
import 'package:relog/domain/auth/model/user.dart';
import 'package:relog/domain/events/model/event_detail.dart';
import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/presentation/events/events_screen.dart';
import 'package:relog/presentation/events/detail/event_detail_screen.dart';
import 'package:relog/presentation/events/write/event_write_screen.dart';
import 'package:relog/presentation/friends/detail/friend_detail_screen.dart';
import 'package:relog/presentation/friends/friends_screen.dart';
import 'package:relog/presentation/friends/select/select_friend_screen.dart';
import 'package:relog/presentation/friends/summary/friend_summary.dart';
import 'package:relog/presentation/friends/write/friend_write_screen.dart';
import 'package:relog/presentation/home/friendship/friendship_screen.dart';
import 'package:relog/presentation/home/home_screen.dart';
import 'package:relog/presentation/my_page/edit/profile_edit_screen.dart';
import 'package:relog/presentation/my_page/my_page_screen.dart';
import 'package:relog/presentation/navigation/bottom_navigation.dart';
import 'package:relog/presentation/gifts/gifts_screen.dart';
import 'package:relog/presentation/gifts/write/gift_write_screen.dart';
import 'package:relog/presentation/sign_in/sign_in_screen.dart';
import 'package:relog/presentation/sign_up/sign_up_screen.dart';
import 'package:relog/presentation/splash/splash_screen.dart';
import 'package:relog/presentation/web_view/web_view_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final routerRefreshProvider = Provider<ValueNotifier<int>>((ref) {
  final notifier = ValueNotifier<int>(0);

  ref.listen<AsyncValue<User?>>(userSessionProvider, (prev, next) {
    final prevSignedIn = prev?.asData?.value != null;
    final nextSignedIn = next.asData?.value != null;

    if (prevSignedIn != nextSignedIn) {
      notifier.value++;
    }
  });

  ref.onDispose(notifier.dispose);
  return notifier;
});

final routerProvider = Provider<GoRouter>((ref) {
  final refresh = ref.watch(routerRefreshProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: RoutePaths.splash,
    refreshListenable: refresh,
    redirect: (context, state) {
      final session = ref.read(userSessionProvider);
      final signedIn = session.when(
        data: (u) => u != null,
        loading: () => null,
        error: (_, __) => false,
      );

      if (signedIn == null) return null;

      final location = state.matchedLocation;

      final inAuthFlow = location == RoutePaths.signIn || location.startsWith(RoutePaths.signIn);

      // 미로그인 & 보호된 영역 -> 로그인
      if (!signedIn && !inAuthFlow && location != RoutePaths.splash) {
        print('📍 로그인 페이지로 라우팅 됩니다.');
        return RoutePaths.signIn;
      }

      // 로그인 상태에서 로그인/스플래시로 이동 -> 홈으로 전환
      if (signedIn && (location == RoutePaths.splash || inAuthFlow)) {
        print('📍 홈 페이지로 라우팅 됩니다.');
        return RoutePaths.home;
      }

      // 카카오 로그인
      final uri = state.uri;
      final isKakaoOauthCallback = uri.scheme.contains('kakao') && uri.authority == 'oauth';

      if (isKakaoOauthCallback) {
        return KakaoLoginFlow.entry == LoginEntry.signIn
            ? RoutePaths.signIn
            : RoutePaths.mypage;
      }

      return null;
    },
    routes: [
      // 스플래시
      GoRoute(
        path: RoutePaths.splash,
        builder: (context, state) => SplashScreen(),
      ),

      // 로그인
      GoRoute(
        path: RoutePaths.signIn,
        builder: (context, state) => SignInScreen(
          onTapSignIn: () {
            context.go(RoutePaths.home);
          },
          onTapSignUp: (request) {
            context.push(
              RoutePaths.signIn + RoutePaths.signUp,
              extra: request,
            );
          },
        ),
        routes: [
          GoRoute(
            path: RoutePaths.signUp,
            builder: (context, state) {
              final request = state.extra as LoginRequest;
              return SignUpScreen(
                request: request,
                onTapSignUp: () {
                  context.go(RoutePaths.signIn);
                },
              );
            },
          ),
        ],
      ),

      // 이벤트
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: RoutePaths.eventDetail,
        builder: (context, state) {
          final id = state.extra as int;

          return EventDetailScreen(
            id: id,
            onTapEdit: (isEdit, event) async {
              final result = await context.push<EventDetail?>(
                RoutePaths.eventDetail + RoutePaths.eventWrite,
                extra: {
                  'isEdit': isEdit,
                  'events': event,
                },
              );
              return result;
            },
          );
        },
        routes: [
          GoRoute(
            parentNavigatorKey: rootNavigatorKey,
            path: RoutePaths.eventWrite,
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>?;
              final bool isEdit = extra?['isEdit'] ?? false;
              final DateTime? date = extra?['date'] as DateTime?;
              final EventDetail? event = extra?['events'] as EventDetail?;

              return EventWriteScreen(
                isEdit: isEdit,
                date: date,
                event: event,
                onTapSearchFriend: () async {
                  final result = await context.push<Map<String, dynamic>>(
                    RoutePaths.selectFriend,
                  );
                  return result;
                },
              );
            },
          ),
        ]
      ),

      // 친구 상세
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: RoutePaths.friendDetail,
        builder: (context, state) {
          final friendId = state.extra as int;
          return FriendDetailScreen(
            friendId: friendId,
            onTapSummary: () {
              context.push(
                RoutePaths.friendDetail + RoutePaths.friendSummary,
              );
            },
            onTapGift: (friend) {
              context.push(
                RoutePaths.gifts,
                extra: friend,
              );
            },
            onTapEventDetail: (id) {
              context.push(
                RoutePaths.eventDetail,
                extra: id,
              );
            },
            onTapEdit: (isEdit, friendInfo) async {
              final refresh = await context.push<Friend?>(
                RoutePaths.friends + RoutePaths.friendWrite,
                extra: {
                  'isEdit': isEdit,
                  'friendInfo': friendInfo,
                },
              );
              return refresh;
            },
          );
        },
        routes: [
          GoRoute(
            path: RoutePaths.friendSummary,
            builder: (context, state) => FriendSummary(),
          )
        ],
      ),

      // 선물
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: RoutePaths.gifts,
        builder: (context, state) {
          final friend = state.extra as Friend;
          return GiftsScreen(
            friend: friend,
            onTapWrite: (isEdit, friend) async {
              final result = await context.push<GiftDetail>(
                RoutePaths.gifts + RoutePaths.giftWrite,
                extra: {
                  'isEdit': isEdit,
                  'friend': friend,
                },
              );
              return result;
            },
            onTapEdit: (isEdit, friendName, giftInfo) async {
              final result = await context.push<GiftDetail>(
                RoutePaths.gifts + RoutePaths.giftWrite,
                extra: {
                  'isEdit': isEdit,
                  'friend': friend,
                  'giftInfo' : giftInfo,
                },
              );
              return result;
            },
          );
        },
        routes: [
          GoRoute(
            parentNavigatorKey: rootNavigatorKey,
            path: RoutePaths.giftWrite,
            builder: (context, state) {
              final extra = state.extra as Map<String, dynamic>?;
              final bool isEdit = extra?['isEdit'] ?? false;
              final Friend friend = extra?['friend'] ?? Friend(id: 0, name: '', score: 0);
              final GiftDetail? giftInfo = extra?['giftInfo'] as GiftDetail?;

              return GiftWriteScreen(
                isEdit: isEdit,
                friend: friend,
                giftInfo: giftInfo,
                onTapSearchFriend: () async {
                  final result = await context.push<Map<String, dynamic>>(
                    RoutePaths.selectFriend,
                  );
                  return result;
                },
              );
            },
          ),
        ],
      ),

      // 친구 선택
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
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
                      onTapFriendDetail: (friendId) {
                        context.push(
                          RoutePaths.friends + RoutePaths.friendDetail,
                          extra: friendId,
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
                path: RoutePaths.events,
                builder: (context, state) => EventsScreen(
                  onTapWrite: (isEdit, date) async {
                    final result = await context.push<EventDetail?>(
                      RoutePaths.eventDetail + RoutePaths.eventWrite,
                      extra: {
                        'isEdit': isEdit,
                        'date': date,
                      },
                    );
                    return result;
                  },
                  onTapGift: (friend) {
                    context.push(
                      RoutePaths.gifts,
                      extra: friend,
                    );
                  },
                  onTapEventDetail: (id) {
                    context.push(
                      RoutePaths.eventDetail,
                      extra: id,
                    );
                  },
                ),
                routes: [
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.friends,
                builder: (context, state) => FriendsScreen(
                  onTapDetail: (friendId) async {
                    final deleted = await context.push<bool>(
                      RoutePaths.friendDetail,
                      extra: friendId,
                    );
                    return deleted ?? false;
                  },
                  onTapWrite: (isEdit) async {
                    final created = await context.push<Friend?>(
                      RoutePaths.friends + RoutePaths.friendWrite,
                      extra: {
                        'isEdit': false,
                        'friendInfo': null,
                      },
                    );
                    return created;
                  },
                ),
                routes: [
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: RoutePaths.friendWrite,
                    builder: (context, state) {
                      final extra = state.extra as Map<String, dynamic>?;
                      final bool isEdit = extra?['isEdit'] ?? false;
                      final Friend? friendInfo = extra?['friendInfo'] as Friend?;

                      return FriendWriteScreen(
                        isEdit: isEdit,
                        friendInfo: friendInfo,
                      );
                    },
                  ),
                ],
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
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      )
    ],
  );
});
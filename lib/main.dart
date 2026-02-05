import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'core/routing/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // env 파일 로드
  await dotenv.load();

  // 카카오 로그인
  final kakaoNativeAppKey = dotenv.get('KAKAO_NATIVE_APP_KEY');
  KakaoSdk.init(
    nativeAppKey: kakaoNativeAppKey,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        scaffoldBackgroundColor: ColorStyles.black22,
        useMaterial3: true,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: ColorStyles.grayA3.withValues(alpha: 0.4), // 선택된 영역 배경색
          cursorColor: ColorStyles.grayA3, // 커서 색상
          selectionHandleColor: ColorStyles.grayA3, // 핸들 색상
        ),
        appBarTheme: AppBarTheme(
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

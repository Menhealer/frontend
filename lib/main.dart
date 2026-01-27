import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:relog/core/presentation/ui/color_styles.dart';
import 'core/routing/router.dart';

Future<void> main() async {
  // .env 파일 로드
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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

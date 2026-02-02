import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/routing/route_paths.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    useEffect(() {
      Future<void> goNext() async {
        await Future.delayed(const Duration(seconds: 4));

        if (!context.mounted) return;

        context.go(RoutePaths.home);
      }

      goNext();
      return null;
    }, const []);

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 24,
            children: [
              SvgPicture.asset(
                'assets/icons/logo.svg',
                width: 128,
                height: 128,
              ),
              SizedBox(
                height: 24,
                width: 24,
                child: const CircularProgressIndicator(color: ColorStyles.grayD3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
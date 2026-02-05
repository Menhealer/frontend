import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/storage/providers/user_session_provider.dart';
import 'package:relog/domain/auth/enum/login_platform.dart';
import 'package:relog/domain/auth/model/login_request.dart';
import 'package:relog/domain/auth/use_case/login_use_case.dart';
import 'package:relog/domain/auth/use_case/providers/auth_use_case_providers.dart';
import 'package:relog/domain/auth/use_case/result/social_login_result.dart';
import 'package:relog/domain/auth/use_case/social_login_use_case.dart';
import 'package:relog/presentation/sign_in/sign_in_state.dart';

class SignInViewModel extends Notifier<SignInState> {
  late final SocialLoginUseCase _socialLoginUseCase;
  late final LoginUseCase _loginUseCase;

  @override
  SignInState build() {
    _socialLoginUseCase = ref.read(socialLoginUseCaseProvider);
    _loginUseCase = ref.read(loginUseCaseProvider);
    return SignInState(isLoading: false);
  }

  Future<SocialLoginResult> socialLogin(LoginPlatform platform) async {
    if (state.isLoading) return const SocialLoginCanceled();

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final token = await _socialLoginUseCase.execute(platform);

      // 소셜 로그인 취소
      if (token == null) {
        state = state.copyWith(isLoading: false);
        return const SocialLoginCanceled();
      }

      final result = await _loginUseCase.execute(
        LoginRequest(provider: platform, token: token),
      );

      if (result.newMember == true) {
        state = state.copyWith(isLoading: false);
        return SocialLoginNeedSignUp(platform: platform, token: token);
      }

      await ref.read(userSessionProvider.notifier).setUser(
        result.member!,
        result.accessToken!,
        result.refreshToken!,
      );

      state = state.copyWith(isLoading: false);
      return const SocialLoginSuccess();
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
      return const SocialLoginCanceled();
    } catch (e) {
      print('login :${e.toString()}');
      state = state.copyWith(
        isLoading: false,
        errorMessage: "로그인 중 알 수 없는\n오류가 발생했습니다.",
      );
      return const SocialLoginCanceled();
    }
  }
}
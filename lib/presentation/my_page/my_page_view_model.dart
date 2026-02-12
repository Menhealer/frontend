import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/storage/providers/user_session_provider.dart';
import 'package:relog/domain/auth/enum/login_platform.dart';
import 'package:relog/domain/auth/model/user_delete_request.dart';
import 'package:relog/domain/auth/use_case/logout_use_case.dart';
import 'package:relog/domain/auth/use_case/providers/auth_use_case_providers.dart';
import 'package:relog/domain/auth/use_case/result/social_login_result.dart';
import 'package:relog/domain/auth/use_case/social_login_use_case.dart';
import 'package:relog/domain/auth/use_case/user_delete_use_case.dart';
import 'package:relog/presentation/my_page/my_page_state.dart';

class MyPageViewModel extends Notifier<MyPageState> {
  late final LogoutUseCase _logoutUseCase;
  late final SocialLoginUseCase _socialLoginUseCase;
  late final UserDeleteUseCase _userDeleteUseCase;

  @override
  MyPageState build() {
    _logoutUseCase = ref.read(logoutUseCaseProvider);
    _userDeleteUseCase = ref.read(userDeleteUseCaseProvider);
    _socialLoginUseCase = ref.read(socialLoginUseCaseProvider);
    return MyPageState(isLoading: false);
  }

  Future<void> logout() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _logoutUseCase.execute();
      await ref.read(userSessionProvider.notifier).clear();
      state = state.copyWith(isLoading: false);
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "로그아웃 중 알 수 없는\n오류가 발생했습니다.",
      );
    }
  }

  Future<SocialLoginResult> userDelete(LoginPlatform platform) async {
    print('platform: $platform');
    if (state.isLoading) return const SocialLoginCanceled();

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final token = await _socialLoginUseCase.execute(platform, false);

      // 소셜 로그인 취소
      if (token == null) {
        state = state.copyWith(isLoading: false);
        return const SocialLoginCanceled();
      }

      // 카카오 탈퇴
      if (platform == LoginPlatform.KAKAO) {
        try {
          await UserApi.instance.unlink();
        } catch (error) {
          state = state.copyWith(isLoading: false, errorMessage: '카카오 계정 연결 해제에 실패했습니다.');
          return const SocialLoginCanceled();
        }
      }

      // 회원탈퇴 api 처리
      final result = await _userDeleteUseCase.execute(
        UserDeleteRequest(
          provider: platform,
          authorizationCode: platform == LoginPlatform.KAKAO ? null : token,
        )
      );

      if (!result) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: '회원 탈퇴에 실패했어요',
        );
        return const SocialLoginCanceled();
      }

      await ref.read(userSessionProvider.notifier).delete();

      state = state.copyWith(isLoading: false);
      return const SocialLoginSuccess();
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
      return const SocialLoginCanceled();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "회원 탈퇴 중 알 수 없는\n오류가 발생했습니다.",
      );
      return const SocialLoginCanceled();
    }
  }
}
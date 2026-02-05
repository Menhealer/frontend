import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/storage/providers/user_session_provider.dart';
import 'package:relog/domain/auth/model/login_request.dart';
import 'package:relog/domain/auth/model/sign_up_request.dart';
import 'package:relog/domain/auth/use_case/providers/auth_use_case_providers.dart';
import 'package:relog/domain/auth/use_case/sign_up_use_case.dart';
import 'package:relog/presentation/sign_up/sign_up_state.dart';

class SignUpViewModel extends Notifier<SignUpState> {
  late final SignUpUseCase _signUpUseCase;

  @override
  SignUpState build() {
    _signUpUseCase = ref.read(signUpUseCaseProvider);
    return SignUpState(isLoading: false);
  }

  Future<bool> signUp(LoginRequest request, String nickname, String birthday) async {
    state = state.copyWith(isLoading: true, errorMessage: null,);

    try {
      final result = await _signUpUseCase.execute(
        SignUpRequest(
          provider: request.provider,
          token: request.token,
          nickname: nickname,
          birthday: birthday,
        ),
      );

      await ref.read(userSessionProvider.notifier).setUser(result.member!, result.accessToken!, result.refreshToken!);
      state = state.copyWith(isLoading: false,);
      return true;
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
      return false;
    } catch (e) {
      print('e: $e');
      state = state.copyWith(isLoading: false, errorMessage: "회원가입 중 알 수 없는\n오류가 발생했습니다.");
      return false;
    }
  }
}
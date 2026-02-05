import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/storage/providers/user_session_provider.dart';
import 'package:relog/domain/auth/enum/login_platform.dart';
import 'package:relog/domain/auth/use_case/logout_use_case.dart';
import 'package:relog/domain/auth/use_case/providers/auth_use_case_providers.dart';
import 'package:relog/presentation/my_page/my_page_state.dart';

class MyPageViewModel extends Notifier<MyPageState> {
  late final LogoutUseCase _logoutUseCase;

  @override
  MyPageState build() {
    _logoutUseCase = ref.read(logoutUseCaseProvider);
    return MyPageState(isLoading: false);
  }

  Future<void> logout() async {
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
}
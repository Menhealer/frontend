import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/data/auth/providers/auth_repository_provider.dart';
import 'package:relog/domain/auth/use_case/login_use_case.dart';
import 'package:relog/domain/auth/use_case/logout_use_case.dart';
import 'package:relog/domain/auth/use_case/profile_edit_use_case.dart';
import 'package:relog/domain/auth/use_case/sign_up_use_case.dart';
import 'package:relog/domain/auth/use_case/social_login_use_case.dart';

final socialLoginUseCaseProvider = Provider<SocialLoginUseCase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return SocialLoginUseCase(repo);
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return LoginUseCase(repo);
});

final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return SignUpUseCase(repo);
});

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return LogoutUseCase(repo);
});

final profileEditUseCaseProvider = Provider<ProfileEditUseCase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return ProfileEditUseCase(repo);
});
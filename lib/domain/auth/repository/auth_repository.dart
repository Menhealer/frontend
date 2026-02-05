import 'package:relog/domain/auth/model/login_request.dart';
import 'package:relog/domain/auth/model/login_response.dart';
import 'package:relog/domain/auth/model/sign_up_request.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequest request);
  Future<LoginResponse> signUp(SignUpRequest request);
  Future<void> logout();

  // social login
  Future<String?> kakaoLogin();
  Future<String?> appleLogin();
}
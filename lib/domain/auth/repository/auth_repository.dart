import 'dart:io';
import 'package:relog/domain/auth/model/login_request.dart';
import 'package:relog/domain/auth/model/login_response.dart';
import 'package:relog/domain/auth/model/sign_up_request.dart';
import 'package:relog/domain/auth/model/user.dart';
import 'package:relog/domain/auth/model/user_delete_request.dart';
import 'package:relog/domain/auth/model/user_edit_request.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequest request);
  Future<LoginResponse> signUp(SignUpRequest request);
  Future<void> logout();
  Future<bool> userDelete(UserDeleteRequest request);
  Future<String> profileImageUpload(File file);
  Future<void>  profileImageDelete();
  Future<User>  profileEdit(UserEditRequest requset);

  // social login
  Future<String?> kakaoLogin();
  Future<String?> appleLogin(bool isLogin);
}
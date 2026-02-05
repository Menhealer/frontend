import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/auth/model/user.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required bool? newMember,
    required String? accessToken,
    required String? refreshToken,
    required User? member,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
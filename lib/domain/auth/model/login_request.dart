import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/auth/enum/login_platform.dart';

part 'login_request.freezed.dart';
part 'login_request.g.dart';

@freezed
abstract class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required LoginPlatform provider,
    required String token,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}
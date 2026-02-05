import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/auth/enum/login_platform.dart';

part 'sign_up_request.freezed.dart';
part 'sign_up_request.g.dart';

@freezed
abstract class SignUpRequest with _$SignUpRequest {
  const factory SignUpRequest({
    required LoginPlatform provider,
    required String token,
    required String nickname,
    required String birthday,
  }) = _SignUpRequest;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
}
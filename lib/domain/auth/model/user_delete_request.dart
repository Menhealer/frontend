import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/auth/enum/login_platform.dart';

part 'user_delete_request.freezed.dart';
part 'user_delete_request.g.dart';

@freezed
abstract class UserDeleteRequest with _$UserDeleteRequest {
  const factory UserDeleteRequest({
    required LoginPlatform provider,
    String? authorizationCode,
  }) = _UserDeleteRequest;

  factory UserDeleteRequest.fromJson(Map<String, dynamic> json) =>
      _$UserDeleteRequestFromJson(json);
}
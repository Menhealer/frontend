import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_edit_request.freezed.dart';
part 'user_edit_request.g.dart';

@freezed
abstract class UserEditRequest with _$UserEditRequest {
  const factory UserEditRequest({
    String? nickname,
    String? birthday,
    String? profileImage,
  }) = _UserEditRequest;

  factory UserEditRequest.fromJson(Map<String, dynamic> json) =>
      _$UserEditRequestFromJson(json);
}
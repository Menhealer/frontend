import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_edit_request.freezed.dart';
part 'friend_edit_request.g.dart';

@freezed
abstract class FriendEditRequest with _$FriendEditRequest {
  const factory FriendEditRequest({
    String? name,
    String? birthday,
    String? group,
  }) = _FriendEditRequest;

  factory FriendEditRequest.fromJson(Map<String, dynamic> json) =>
      _$FriendEditRequestFromJson(json);
}
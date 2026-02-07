import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_write_request.freezed.dart';
part 'friend_write_request.g.dart';

@freezed
abstract class FriendWriteRequest with _$FriendWriteRequest {
  const factory FriendWriteRequest({
    required String name,
    String? birthday,
    String? group,
  }) = _FriendWriteRequest;

  factory FriendWriteRequest.fromJson(Map<String, dynamic> json) =>
      _$FriendWriteRequestFromJson(json);
}
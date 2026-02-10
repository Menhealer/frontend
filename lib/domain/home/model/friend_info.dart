import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_info.freezed.dart';
part 'friend_info.g.dart';

@freezed
abstract class FriendInfo with _$FriendInfo {
  const factory FriendInfo({
    required int friendId,
    required String friendName,
  }) = _FriendInfo;

  factory FriendInfo.fromJson(Map<String, dynamic> json) =>
      _$FriendInfoFromJson(json);
}
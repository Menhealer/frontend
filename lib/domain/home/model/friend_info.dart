import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/friends/model/friend.dart';

part 'friend_info.freezed.dart';
part 'friend_info.g.dart';

@freezed
abstract class FriendInfo with _$FriendInfo {
  const factory FriendInfo({
    required Friend friend,
    required String recommendation,
  }) = _FriendInfo;

  factory FriendInfo.fromJson(Map<String, dynamic> json) =>
      _$FriendInfoFromJson(json);
}
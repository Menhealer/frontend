// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FriendInfo _$FriendInfoFromJson(Map<String, dynamic> json) => _FriendInfo(
  friendId: (json['friendId'] as num).toInt(),
  friendName: json['friendName'] as String,
);

Map<String, dynamic> _$FriendInfoToJson(_FriendInfo instance) =>
    <String, dynamic>{
      'friendId': instance.friendId,
      'friendName': instance.friendName,
    };

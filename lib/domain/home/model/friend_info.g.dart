// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FriendInfo _$FriendInfoFromJson(Map<String, dynamic> json) => _FriendInfo(
  friend: Friend.fromJson(json['friend'] as Map<String, dynamic>),
  recommendation: json['recommendation'] as String,
);

Map<String, dynamic> _$FriendInfoToJson(_FriendInfo instance) =>
    <String, dynamic>{
      'friend': instance.friend,
      'recommendation': instance.recommendation,
    };

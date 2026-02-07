// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FriendDetail _$FriendDetailFromJson(Map<String, dynamic> json) =>
    _FriendDetail(
      friend: Friend.fromJson(json['friend'] as Map<String, dynamic>),
      recentEvents: (json['recentEvents'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      giftHistory: (json['giftHistory'] as List<dynamic>?)
          ?.map((e) => Gift.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FriendDetailToJson(_FriendDetail instance) =>
    <String, dynamic>{
      'friend': instance.friend,
      'recentEvents': instance.recentEvents,
      'giftHistory': instance.giftHistory,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Friend _$FriendFromJson(Map<String, dynamic> json) => _Friend(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  score: (json['score'] as num).toInt(),
  group: json['group'] as String?,
  birthday: json['birthday'] as String?,
);

Map<String, dynamic> _$FriendToJson(_Friend instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'score': instance.score,
  'group': instance.group,
  'birthday': instance.birthday,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FriendWriteRequest _$FriendWriteRequestFromJson(Map<String, dynamic> json) =>
    _FriendWriteRequest(
      name: json['name'] as String,
      birthday: json['birthday'] as String?,
      group: json['group'] as String?,
    );

Map<String, dynamic> _$FriendWriteRequestToJson(_FriendWriteRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birthday': instance.birthday,
      'group': instance.group,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  nickname: json['nickname'] as String,
  birthday: json['birthday'] as String,
  profileImage: json['profileImage'] as String?,
  provider: json['provider'] as String,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'nickname': instance.nickname,
  'birthday': instance.birthday,
  'profileImage': instance.profileImage,
  'provider': instance.provider,
};

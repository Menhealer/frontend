// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      newMember: json['newMember'] as bool?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      member: json['member'] == null
          ? null
          : User.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'newMember': instance.newMember,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'member': instance.member,
    };

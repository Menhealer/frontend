// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      provider: $enumDecode(_$LoginPlatformEnumMap, json['provider']),
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{
      'provider': _$LoginPlatformEnumMap[instance.provider]!,
      'token': instance.token,
    };

const _$LoginPlatformEnumMap = {
  LoginPlatform.KAKAO: 'KAKAO',
  LoginPlatform.APPLE: 'APPLE',
};

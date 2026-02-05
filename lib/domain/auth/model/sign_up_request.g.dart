// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    _SignUpRequest(
      provider: $enumDecode(_$LoginPlatformEnumMap, json['provider']),
      token: json['token'] as String,
      nickname: json['nickname'] as String,
      birthday: json['birthday'] as String,
    );

Map<String, dynamic> _$SignUpRequestToJson(_SignUpRequest instance) =>
    <String, dynamic>{
      'provider': _$LoginPlatformEnumMap[instance.provider]!,
      'token': instance.token,
      'nickname': instance.nickname,
      'birthday': instance.birthday,
    };

const _$LoginPlatformEnumMap = {
  LoginPlatform.KAKAO: 'KAKAO',
  LoginPlatform.APPLE: 'APPLE',
};

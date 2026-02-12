// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_delete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDeleteRequest _$UserDeleteRequestFromJson(Map<String, dynamic> json) =>
    _UserDeleteRequest(
      provider: $enumDecode(_$LoginPlatformEnumMap, json['provider']),
      authorizationCode: json['authorizationCode'] as String?,
    );

Map<String, dynamic> _$UserDeleteRequestToJson(_UserDeleteRequest instance) =>
    <String, dynamic>{
      'provider': _$LoginPlatformEnumMap[instance.provider]!,
      'authorizationCode': instance.authorizationCode,
    };

const _$LoginPlatformEnumMap = {
  LoginPlatform.KAKAO: 'KAKAO',
  LoginPlatform.APPLE: 'APPLE',
};

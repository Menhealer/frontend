// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_edit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEditRequest _$UserEditRequestFromJson(Map<String, dynamic> json) =>
    _UserEditRequest(
      nickname: json['nickname'] as String?,
      birthday: json['birthday'] as String?,
      profileImage: json['profileImage'] as String?,
    );

Map<String, dynamic> _$UserEditRequestToJson(_UserEditRequest instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'birthday': instance.birthday,
      'profileImage': instance.profileImage,
    };

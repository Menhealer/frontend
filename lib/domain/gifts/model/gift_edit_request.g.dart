// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_edit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GiftEditRequest _$GiftEditRequestFromJson(Map<String, dynamic> json) =>
    _GiftEditRequest(
      price: (json['price'] as num?)?.toInt(),
      giftDate: json['giftDate'] as String?,
      giftType: $enumDecodeNullable(_$GiftTypeEnumMap, json['giftType']),
      direction: $enumDecodeNullable(_$DirectionEnumMap, json['direction']),
      description: json['description'] as String?,
      friendId: (json['friendId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GiftEditRequestToJson(_GiftEditRequest instance) =>
    <String, dynamic>{
      'price': instance.price,
      'giftDate': instance.giftDate,
      'giftType': _$GiftTypeEnumMap[instance.giftType],
      'direction': _$DirectionEnumMap[instance.direction],
      'description': instance.description,
      'friendId': instance.friendId,
    };

const _$GiftTypeEnumMap = {
  GiftType.BIRTHDAY: 'BIRTHDAY',
  GiftType.CONGRATULATORY: 'CONGRATULATORY',
  GiftType.OTHER: 'OTHER',
};

const _$DirectionEnumMap = {
  Direction.GIVEN: 'GIVEN',
  Direction.RECEIVED: 'RECEIVED',
};

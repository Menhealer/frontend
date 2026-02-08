// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GiftWriteRequest _$GiftWriteRequestFromJson(Map<String, dynamic> json) =>
    _GiftWriteRequest(
      price: (json['price'] as num).toInt(),
      giftDate: json['giftDate'] as String,
      giftType: $enumDecode(_$GiftTypeEnumMap, json['giftType']),
      direction: $enumDecode(_$DirectionEnumMap, json['direction']),
      description: json['description'] as String?,
      friendId: (json['friendId'] as num).toInt(),
    );

Map<String, dynamic> _$GiftWriteRequestToJson(_GiftWriteRequest instance) =>
    <String, dynamic>{
      'price': instance.price,
      'giftDate': instance.giftDate,
      'giftType': _$GiftTypeEnumMap[instance.giftType]!,
      'direction': _$DirectionEnumMap[instance.direction]!,
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

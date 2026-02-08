// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Gift _$GiftFromJson(Map<String, dynamic> json) => _Gift(
  giftId: (json['giftId'] as num).toInt(),
  price: (json['price'] as num).toInt(),
  giftDate: json['giftDate'] as String,
  giftType: $enumDecode(_$GiftTypeEnumMap, json['giftType']),
  direction: $enumDecode(_$DirectionEnumMap, json['direction']),
  description: json['description'] as String?,
);

Map<String, dynamic> _$GiftToJson(_Gift instance) => <String, dynamic>{
  'giftId': instance.giftId,
  'price': instance.price,
  'giftDate': instance.giftDate,
  'giftType': _$GiftTypeEnumMap[instance.giftType]!,
  'direction': _$DirectionEnumMap[instance.direction]!,
  'description': instance.description,
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

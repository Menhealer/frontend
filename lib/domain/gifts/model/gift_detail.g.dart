// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GiftDetail _$GiftDetailFromJson(Map<String, dynamic> json) => _GiftDetail(
  id: (json['id'] as num).toInt(),
  price: (json['price'] as num).toInt(),
  giftDate: json['giftDate'] as String,
  giftType: $enumDecode(_$GiftTypeEnumMap, json['giftType']),
  direction: $enumDecode(_$DirectionEnumMap, json['direction']),
  description: json['description'] as String?,
  friendId: (json['friendId'] as num).toInt(),
  friendName: json['friendName'] as String,
);

Map<String, dynamic> _$GiftDetailToJson(_GiftDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'giftDate': instance.giftDate,
      'giftType': _$GiftTypeEnumMap[instance.giftType]!,
      'direction': _$DirectionEnumMap[instance.direction]!,
      'description': instance.description,
      'friendId': instance.friendId,
      'friendName': instance.friendName,
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Event _$EventFromJson(Map<String, dynamic> json) => _Event(
  eventId: (json['eventId'] as num).toInt(),
  title: json['title'] as String,
  eventDate: json['eventDate'] as String,
  reviewScore: $enumDecode(_$ReviewScoreEnumMap, json['reviewScore']),
);

Map<String, dynamic> _$EventToJson(_Event instance) => <String, dynamic>{
  'eventId': instance.eventId,
  'title': instance.title,
  'eventDate': instance.eventDate,
  'reviewScore': _$ReviewScoreEnumMap[instance.reviewScore]!,
};

const _$ReviewScoreEnumMap = {
  ReviewScore.VERY_BAD: 'VERY_BAD',
  ReviewScore.BAD: 'BAD',
  ReviewScore.NEUTRAL: 'NEUTRAL',
  ReviewScore.GOOD: 'GOOD',
  ReviewScore.VERY_GOOD: 'VERY_GOOD',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventDetail _$EventDetailFromJson(Map<String, dynamic> json) => _EventDetail(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  eventDate: json['eventDate'] as String,
  reviewScore: $enumDecode(_$ReviewScoreEnumMap, json['reviewScore']),
  reviewText: json['reviewText'] as String?,
  friendId: (json['friendId'] as num).toInt(),
  friendName: json['friendName'] as String,
);

Map<String, dynamic> _$EventDetailToJson(_EventDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'eventDate': instance.eventDate,
      'reviewScore': _$ReviewScoreEnumMap[instance.reviewScore]!,
      'reviewText': instance.reviewText,
      'friendId': instance.friendId,
      'friendName': instance.friendName,
    };

const _$ReviewScoreEnumMap = {
  ReviewScore.VERY_BAD: 'VERY_BAD',
  ReviewScore.BAD: 'BAD',
  ReviewScore.NEUTRAL: 'NEUTRAL',
  ReviewScore.GOOD: 'GOOD',
  ReviewScore.VERY_GOOD: 'VERY_GOOD',
};

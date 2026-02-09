// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_write_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventWriteRequest _$EventWriteRequestFromJson(Map<String, dynamic> json) =>
    _EventWriteRequest(
      title: json['title'] as String,
      eventDate: json['eventDate'] as String,
      friendId: (json['friendId'] as num).toInt(),
      reviewScore: $enumDecode(_$ReviewScoreEnumMap, json['reviewScore']),
      reviewText: json['reviewText'] as String?,
    );

Map<String, dynamic> _$EventWriteRequestToJson(_EventWriteRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'eventDate': instance.eventDate,
      'friendId': instance.friendId,
      'reviewScore': _$ReviewScoreEnumMap[instance.reviewScore]!,
      'reviewText': instance.reviewText,
    };

const _$ReviewScoreEnumMap = {
  ReviewScore.VERY_BAD: 'VERY_BAD',
  ReviewScore.BAD: 'BAD',
  ReviewScore.NEUTRAL: 'NEUTRAL',
  ReviewScore.GOOD: 'GOOD',
  ReviewScore.VERY_GOOD: 'VERY_GOOD',
};

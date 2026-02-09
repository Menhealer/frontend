// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_edit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventEditRequest _$EventEditRequestFromJson(Map<String, dynamic> json) =>
    _EventEditRequest(
      title: json['title'] as String?,
      eventDate: json['eventDate'] as String?,
      friendId: (json['friendId'] as num?)?.toInt(),
      reviewScore: $enumDecodeNullable(
        _$ReviewScoreEnumMap,
        json['reviewScore'],
      ),
      reviewText: json['reviewText'] as String?,
    );

Map<String, dynamic> _$EventEditRequestToJson(_EventEditRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'eventDate': instance.eventDate,
      'friendId': instance.friendId,
      'reviewScore': _$ReviewScoreEnumMap[instance.reviewScore],
      'reviewText': instance.reviewText,
    };

const _$ReviewScoreEnumMap = {
  ReviewScore.VERY_BAD: 'VERY_BAD',
  ReviewScore.BAD: 'BAD',
  ReviewScore.NEUTRAL: 'NEUTRAL',
  ReviewScore.GOOD: 'GOOD',
  ReviewScore.VERY_GOOD: 'VERY_GOOD',
};

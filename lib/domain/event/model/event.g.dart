// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Event _$EventFromJson(Map<String, dynamic> json) => _Event(
  eventId: (json['eventId'] as num).toInt(),
  title: json['title'] as String,
  eventDate: json['eventDate'] as String,
  reviewScore: (json['reviewScore'] as num).toInt(),
);

Map<String, dynamic> _$EventToJson(_Event instance) => <String, dynamic>{
  'eventId': instance.eventId,
  'title': instance.title,
  'eventDate': instance.eventDate,
  'reviewScore': instance.reviewScore,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Day _$DayFromJson(Map<String, dynamic> json) => _Day(
  date: json['date'] as String,
  events: (json['events'] as List<dynamic>)
      .map((e) => EventDetail.fromJson(e as Map<String, dynamic>))
      .toList(),
  birthdays: (json['birthdays'] as List<dynamic>)
      .map((e) => Friend.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DayToJson(_Day instance) => <String, dynamic>{
  'date': instance.date,
  'events': instance.events,
  'birthdays': instance.birthdays,
};

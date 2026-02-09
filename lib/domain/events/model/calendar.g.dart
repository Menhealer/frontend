// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Calendar _$CalendarFromJson(Map<String, dynamic> json) => _Calendar(
  year: (json['year'] as num).toInt(),
  month: (json['month'] as num).toInt(),
  days: (json['days'] as List<dynamic>)
      .map((e) => Day.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CalendarToJson(_Calendar instance) => <String, dynamic>{
  'year': instance.year,
  'month': instance.month,
  'days': instance.days,
};

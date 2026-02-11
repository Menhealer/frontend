// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Monthly _$MonthlyFromJson(Map<String, dynamic> json) => _Monthly(
  analysis: json['analysis'] as String?,
  suggestions: (json['suggestions'] as List<dynamic>)
      .map((e) => e as String?)
      .toList(),
);

Map<String, dynamic> _$MonthlyToJson(_Monthly instance) => <String, dynamic>{
  'analysis': instance.analysis,
  'suggestions': instance.suggestions,
};

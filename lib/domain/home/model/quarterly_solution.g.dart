// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quarterly_solution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuarterlySolution _$QuarterlySolutionFromJson(Map<String, dynamic> json) =>
    _QuarterlySolution(
      overallAnalysis: json['overallAnalysis'] as String?,
      positiveInsights: (json['positiveInsights'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      negativeInsights: (json['negativeInsights'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
      actionItems: (json['actionItems'] as List<dynamic>)
          .map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$QuarterlySolutionToJson(_QuarterlySolution instance) =>
    <String, dynamic>{
      'overallAnalysis': instance.overallAnalysis,
      'positiveInsights': instance.positiveInsights,
      'negativeInsights': instance.negativeInsights,
      'actionItems': instance.actionItems,
    };

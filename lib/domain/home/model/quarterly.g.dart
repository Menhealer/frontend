// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quarterly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Quarterly _$QuarterlyFromJson(Map<String, dynamic> json) => _Quarterly(
  bestFriends: (json['bestFriends'] as List<dynamic>)
      .map(
        (e) =>
            e == null ? null : FriendInfo.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  worstFriends: (json['worstFriends'] as List<dynamic>)
      .map(
        (e) =>
            e == null ? null : FriendInfo.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  overallAnalysis: json['overallAnalysis'] as String?,
  solution: json['solution'] == null
      ? null
      : QuarterlySolution.fromJson(json['solution'] as Map<String, dynamic>),
);

Map<String, dynamic> _$QuarterlyToJson(_Quarterly instance) =>
    <String, dynamic>{
      'bestFriends': instance.bestFriends,
      'worstFriends': instance.worstFriends,
      'overallAnalysis': instance.overallAnalysis,
      'solution': instance.solution,
    };

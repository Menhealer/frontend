import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/events/model/event_detail.dart';
import 'package:relog/domain/friends/model/friend.dart';

part 'day.freezed.dart';
part 'day.g.dart';

@freezed
abstract class Day with _$Day {
  const factory Day({
    required String date,
    required List<EventDetail> events,
    required List<Friend> birthdays,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) =>
      _$DayFromJson(json);
}
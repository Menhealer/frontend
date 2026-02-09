import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/events/model/day.dart';

part 'calendar.freezed.dart';
part 'calendar.g.dart';

@freezed
abstract class Calendar with _$Calendar {
  const factory Calendar({
    required int year,
    required int month,
    required List<Day> days,
  }) = _Calendar;

  factory Calendar.fromJson(Map<String, dynamic> json) =>
      _$CalendarFromJson(json);
}
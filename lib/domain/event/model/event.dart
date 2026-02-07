import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
abstract class Event with _$Event {
  const factory Event({
    required int eventId,
    required String title,
    required String eventDate,
    required int reviewScore,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) =>
      _$EventFromJson(json);
}
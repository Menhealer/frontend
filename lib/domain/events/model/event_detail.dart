import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/events/enum/review_score.dart';

part 'event_detail.freezed.dart';
part 'event_detail.g.dart';

@freezed
abstract class EventDetail with _$EventDetail {
  const factory EventDetail({
    required int id,
    required String title,
    required String eventDate,
    required ReviewScore reviewScore,
    String? reviewText,
    required int friendId,
    required String friendName,
  }) = _EventDetail;

  factory EventDetail.fromJson(Map<String, dynamic> json) =>
      _$EventDetailFromJson(json);
}
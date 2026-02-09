import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/events/enum/review_score.dart';

part 'event_write_request.freezed.dart';
part 'event_write_request.g.dart';

@freezed
abstract class EventWriteRequest with _$EventWriteRequest {
  const factory EventWriteRequest({
    required String title,
    required String eventDate,
    required int friendId,
    required ReviewScore reviewScore,
    String? reviewText,
  }) = _EventWriteRequest;

  factory EventWriteRequest.fromJson(Map<String, dynamic> json) =>
      _$EventWriteRequestFromJson(json);
}
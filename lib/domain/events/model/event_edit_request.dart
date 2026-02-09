import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/events/enum/review_score.dart';

part 'event_edit_request.freezed.dart';
part 'event_edit_request.g.dart';

@freezed
abstract class EventEditRequest with _$EventEditRequest {
  const factory EventEditRequest({
    String? title,
    String? eventDate,
    int? friendId,
    ReviewScore? reviewScore,
    String? reviewText,
  }) = _EventEditRequest;

  factory EventEditRequest.fromJson(Map<String, dynamic> json) =>
      _$EventEditRequestFromJson(json);
}
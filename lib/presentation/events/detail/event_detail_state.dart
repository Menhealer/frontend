import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/events/enum/review_score.dart';
import 'package:relog/domain/events/model/event_detail.dart';

class EventDetailState {
  final bool isLoading;
  final String? errorMessage;
  final EventDetail? event;

  EventDetailState({
    required this.isLoading,
    this.errorMessage,
    this.event,
  });

  EventDetailState copyWith({
    bool? isLoading,
    String? errorMessage,
    EventDetail? event,
  }) {
    return EventDetailState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      event: event ?? this.event,
    );
  }


  bool get hasData => event != null;

  String get title => event?.title ?? '';
  String get friendName => event?.friendName ?? '';
  String get periodText => event == null ? '' : formatPeriodDate(event!.eventDate);

  bool get hasReviewText {
    final t = event?.reviewText;
    return t != null && t.trim().isNotEmpty;
  }

  String get reviewTextOrEmpty => event?.reviewText?.trim() ?? '';

  ReviewScore? get reviewScore => event?.reviewScore;
}
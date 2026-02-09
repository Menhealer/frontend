import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/presentation/widgets/picker/date_picker.dart';
import 'package:relog/domain/events/enum/review_score.dart';
import 'package:relog/domain/events/model/event_detail.dart';
import 'package:relog/domain/events/model/event_edit_request.dart';
import 'package:relog/domain/events/model/event_write_request.dart';
import 'package:relog/domain/events/use_case/event_edit_use_case.dart';
import 'package:relog/domain/events/use_case/event_write_use_case.dart';
import 'package:relog/domain/events/use_case/providers/events_use_case_providers.dart';
import 'package:relog/presentation/events/write/event_write_state.dart';

class EventWriteViewModel extends Notifier<EventWriteState> {
  late final EventWriteUseCase _eventWriteUseCase;
  late final EventEditUseCase _eventEditUseCase;

  @override
  EventWriteState build() {
    _eventWriteUseCase = ref.read(eventWriteUseCaseProvider);
    _eventEditUseCase = ref.read(eventEditUseCaseProvider);

    return const EventWriteState(
      isLoading: false,
      isEdit: false,
      friendName: '',
      reviewText: '',
    );
  }

  void initialize({
    required bool isEdit,
    EventDetail? event,
    DateTime? date,
  }) {
    if (!isEdit || event == null) {
      final d = date ?? DateTime.now();

      state = EventWriteState(
        isLoading: false,
        isEdit: false,
        friendId: event?.friendId,
        friendName: event?.friendName ?? '',
        reviewText: '',
        year: d.year,
        month: d.month,
        day: d.day,
        reviewScore: ReviewScore.NEUTRAL,
      );
      return;
    }

    if (state.isEdit && state.eventId == event.id) return;

    final parsed = DateTime.parse(event.eventDate);

    state = state.copyWith(
      isEdit: true,
      eventId: event.id,
      friendId: event.friendId,
      friendName: event.friendName,
      title: event.title,
      reviewScore: event.reviewScore,
      year: parsed.year,
      month: parsed.month,
      day: parsed.day,
      reviewText: event.reviewText ?? '',
      originalFriendId: event.friendId,
      originalTitle: event.title,
      originalDate: event.eventDate,
      originalReviewScore: event.reviewScore,
      originalReviewText: event.reviewText,
    );
  }

  void onFriendSelected(int id, String name) =>
      state = state.copyWith(friendId: id, friendName: name);

  void onReviewScoreSelected(ReviewScore s) =>
      state = state.copyWith(reviewScore: s);

  void onDatePicked(DatePicker d) {
    state = state.copyWith(
      year: d.year, month: d.month, day: d.day,
    );
  }

  void onTitleChanged(String? t) =>
      state = state.copyWith(title: t);

  void onReviewTextChanged(String t) =>
      state = state.copyWith(reviewText: t);

  Future<EventDetail?> submit() async {
    if (!state.canSubmit || state.isLoading) return null;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      if (state.isEdit) {
        final friendIdChanged = state.friendId != state.originalFriendId;
        final titleChanged = state.title != state.originalTitle;
        final reviewScoreChanged = state.reviewScore != state.originalReviewScore;
        final dateChanged = state.eventDateYmd != state.originalDate;
        final reviewTextChanged = state.reviewText.trim() != (state.originalReviewText ?? '').trim();

        final req = EventEditRequest(
          title: titleChanged ? state.title : null,
          eventDate: dateChanged ? state.eventDateYmd : null,
          friendId: friendIdChanged ? state.friendId : null,
          reviewScore: reviewScoreChanged ? state.reviewScore : null,
          reviewText: reviewTextChanged
              ? (state.reviewText.trim().isEmpty ? '' : state.reviewText.trim())
              : null,
        );

        final result = await _eventEditUseCase.execute(req, state.eventId!);
        state = state.copyWith(isLoading: false);
        return result;
      } else {
        final req = EventWriteRequest(
          title: state.title!,
          eventDate: state.eventDateYmd!,
          friendId: state.friendId!,
          reviewScore: state.reviewScore!,
          reviewText: state.reviewText.trim().isEmpty
              ? null
              : state.reviewText.trim(),
        );

        final result = await _eventWriteUseCase.execute(req);
        state = state.copyWith(isLoading: false);
        return result;
      }
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
      return null;
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '선물 등록 중\n알 수 없는 오류가 발생했습니다.',
      );
      return null;
    }
  }
}
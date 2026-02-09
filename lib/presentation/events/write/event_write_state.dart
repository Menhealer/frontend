import 'package:relog/domain/events/enum/review_score.dart';
import 'package:relog/core/utils/time_format.dart';

class EventWriteState {
  final bool isLoading;
  final String? errorMessage;

  // mode
  final bool isEdit;
  final int? eventId;

  // friend
  final int? friendId;
  final String friendName;

  // form
  final String? title;
  final ReviewScore? reviewScore;
  final int? year;
  final int? month;
  final int? day;
  final String reviewText;

  // original (edit dirty check)
  final int? originalFriendId;
  final String? originalTitle;
  final String? originalDate;
  final ReviewScore? originalReviewScore;
  final String? originalReviewText;

  const EventWriteState({
    required this.isLoading,
    this.errorMessage,
    required this.isEdit,
    this.eventId,
    this.friendId,
    required this.friendName,
    this.title,
    this.reviewScore,
    this.year,
    this.month,
    this.day,
    required this.reviewText,
    this.originalFriendId,
    this.originalTitle,
    this.originalDate,
    this.originalReviewScore,
    this.originalReviewText,
  });

  // ===== getters =====

  bool get isTitleValid => (title?.trim().isNotEmpty ?? false);
  bool get isDateValid => year != null && month != null && day != null;
  bool get isFriendValid => friendId != null;
  bool get isTagValid => reviewScore != null;

  bool get canSubmit =>
      isFriendValid &&
          isTagValid &&
          isDateValid &&
          isTitleValid &&
          (isEdit ? isDirty : true);

  bool get isDirty {
    if (!isEdit) return true;

    return friendId != originalFriendId ||
        title != originalTitle ||
        reviewScore != originalReviewScore ||
        eventDateYmd != originalDate ||
        reviewText.trim() != (originalReviewText ?? '').trim();
  }

  String? get eventDateYmd {
    if (!isDateValid) return null;
    return formatIntBirthday(year!, month!, day!);
  }

  EventWriteState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isEdit,
    int? eventId,
    int? friendId,
    String? friendName,
    String? title,
    ReviewScore? reviewScore,
    int? year,
    int? month,
    int? day,
    String? reviewText,
    int? originalFriendId,
    String? originalTitle,
    String? originalDate,
    ReviewScore? originalReviewScore,
    String? originalReviewText,
  }) {
    return EventWriteState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isEdit: isEdit ?? this.isEdit,
      eventId: eventId ?? this.eventId,
      friendId: friendId ?? this.friendId,
      friendName: friendName ?? this.friendName,
      title: title ?? this.title,
      reviewScore: reviewScore ?? this.reviewScore,
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
      reviewText: reviewText ?? this.reviewText,
      originalFriendId: originalFriendId ?? this.originalFriendId,
      originalTitle: originalTitle ?? this.originalTitle,
      originalDate: originalDate ?? this.originalDate,
      originalReviewScore: originalReviewScore ?? this.originalReviewScore,
      originalReviewText: originalReviewText ?? this.originalReviewText,
    );
  }
}
class EventDetail {
  final int id;
  final String title;
  final String eventDate;
  final int reviewScore;
  final String? reviewText;
  final int friendId;
  final String friendName;

  EventDetail({
    required this.id,
    required this.title,
    required this.eventDate,
    required this.reviewScore,
    this.reviewText,
    required this.friendId,
    required this.friendName,
  });
}
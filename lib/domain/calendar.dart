class Calendar {
  final int id;
  final int friendId;
  final String friendName;
  final String title;
  final String category;
  final int score;
  final String? info;

  const Calendar({
    required this.id,
    required this.friendId,
    required this.friendName,
    required this.title,
    required this.category,
    required this.score,
    this.info,
  });
}
class Event {
  final int id;
  final DateTime date;
  final String title;
  final String name;
  final int? score;
  final String? info;

  Event({
    required this.id,
    required this.date,
    required this.title,
    required this.name,
    this.score,
    this.info,
  });
}
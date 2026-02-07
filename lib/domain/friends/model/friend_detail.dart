import 'package:relog/domain/event.dart';
import 'package:relog/domain/presents/present.dart';

class FriendDetail {
  final int id;
  final String name;
  final int score;
  final String? group;
  final DateTime? birthday;
  final List<Event>? eventList;
  final List<Present>? presentList;

  FriendDetail({
    required this.id,
    required this.name,
    required this.score,
    this.group,
    this.birthday,
    this.eventList,
    this.presentList,
  });
}
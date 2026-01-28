import 'package:relog/domain/event.dart';
import 'package:relog/domain/friends/present.dart';

class FriendDetail {
  final int id;
  final String name;
  final int score;
  final String? group;
  final String? birthday;
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
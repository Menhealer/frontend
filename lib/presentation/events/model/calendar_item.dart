import 'package:relog/domain/events/enum/review_score.dart';
import 'package:relog/domain/events/model/event_detail.dart';
import 'package:relog/domain/friends/model/friend.dart';

enum CalendarItemType { event, birthday }

class CalendarItem {
  final CalendarItemType type;

  // 공통
  final int id;
  final int friendId;
  final String friendName;

  // event
  final String? title;
  final String? eventDate;
  final int? reviewScore;
  final String? reviewText;

  // birthday
  final String? birthday;
  final String? group;
  final int? score;

  const CalendarItem._({
    required this.type,
    required this.id,
    required this.friendId,
    required this.friendName,
    this.title,
    this.eventDate,
    this.reviewScore,
    this.reviewText,
    this.birthday,
    this.group,
    this.score,
  });

  factory CalendarItem.fromEvent(EventDetail e) {
    return CalendarItem._(
      type: CalendarItemType.event,
      id: e.id,
      friendId: e.friendId,
      friendName: e.friendName,
      title: e.title,
      eventDate: e.eventDate,
      reviewScore: e.reviewScore.toInt,
      reviewText: e.reviewText,
    );
  }

  factory CalendarItem.fromBirthday(Friend f) {
    return CalendarItem._(
      type: CalendarItemType.birthday,
      id: f.id,
      friendId: f.id,
      friendName: f.name,
      birthday: f.birthday,
      group: f.group,
      score: 0,
    );
  }
}
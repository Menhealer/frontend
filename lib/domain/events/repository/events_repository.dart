import 'package:relog/domain/events/model/calendar.dart';

abstract class EventsRepository {
  Future<Calendar> getCalendar(int year, int month);
}
import 'package:relog/domain/events/model/calendar.dart';
import 'package:relog/domain/events/model/event_detail.dart';
import 'package:relog/domain/events/model/event_edit_request.dart';
import 'package:relog/domain/events/model/event_write_request.dart';

abstract class EventsRepository {
  Future<Calendar> getCalendar(int year, int month);
  Future<EventDetail> getEvent(int eventId);
  Future<EventDetail> eventWrite(EventWriteRequest request);
  Future<EventDetail> eventEdit(EventEditRequest request, int eventId);
}
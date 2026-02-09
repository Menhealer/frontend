import 'package:relog/domain/events/model/calendar.dart';
import 'package:relog/domain/events/repository/events_repository.dart';

class GetCalendarUseCase {
  final EventsRepository _eventsRepository;
  GetCalendarUseCase(this._eventsRepository);

  Future<Calendar> execute(int year, int month) async {
    return await _eventsRepository.getCalendar(year, month);
  }
}
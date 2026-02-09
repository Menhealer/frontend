import 'package:relog/domain/events/model/event_detail.dart';
import 'package:relog/domain/events/repository/events_repository.dart';

class GetEventUseCase {
  final EventsRepository _eventsRepository;
  GetEventUseCase(this._eventsRepository);

  Future<EventDetail> execute(int eventId) async {
    return await _eventsRepository.getEvent(eventId);
  }
}
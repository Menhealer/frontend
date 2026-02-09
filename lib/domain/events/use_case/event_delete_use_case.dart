import 'package:relog/domain/events/repository/events_repository.dart';

class EventDeleteUseCase {
  final EventsRepository _eventsRepository;
  EventDeleteUseCase(this._eventsRepository);

  Future<bool> execute(int eventId) async {
    return await _eventsRepository.eventDelete(eventId);
  }
}
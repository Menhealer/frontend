import 'package:relog/domain/events/model/event_detail.dart';
import 'package:relog/domain/events/model/event_write_request.dart';
import 'package:relog/domain/events/repository/events_repository.dart';

class EventWriteUseCase {
  final EventsRepository _eventsRepository;
  EventWriteUseCase(this._eventsRepository);

  Future<EventDetail> execute(EventWriteRequest request) async {
    return await _eventsRepository.eventWrite(request);
  }
}
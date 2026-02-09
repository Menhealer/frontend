import 'package:relog/domain/events/model/event_detail.dart';
import 'package:relog/domain/events/model/event_edit_request.dart';
import 'package:relog/domain/events/repository/events_repository.dart';

class EventEditUseCase {
  final EventsRepository _eventsRepository;
  EventEditUseCase(this._eventsRepository);

  Future<EventDetail> execute(EventEditRequest request, int eventId) async {
    return await _eventsRepository.eventEdit(request, eventId);
  }
}
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/data/events/providers/events_repository_provider.dart';
import 'package:relog/domain/events/use_case/event_edit_use_case.dart';
import 'package:relog/domain/events/use_case/event_write_use_case.dart';
import 'package:relog/domain/events/use_case/get_calendar_use_case.dart';
import 'package:relog/domain/events/use_case/get_event_use_case.dart';

final getCalendarUseCaseProvider = Provider<GetCalendarUseCase>((ref) {
  final repo = ref.watch(eventsRepositoryProvider);
  return GetCalendarUseCase(repo);
});

final getEventUseCaseProvider = Provider<GetEventUseCase>((ref) {
  final repo = ref.watch(eventsRepositoryProvider);
  return GetEventUseCase(repo);
});

final eventWriteUseCaseProvider = Provider<EventWriteUseCase>((ref) {
  final repo = ref.watch(eventsRepositoryProvider);
  return EventWriteUseCase(repo);
});

final eventEditUseCaseProvider = Provider<EventEditUseCase>((ref) {
  final repo = ref.watch(eventsRepositoryProvider);
  return EventEditUseCase(repo);
});

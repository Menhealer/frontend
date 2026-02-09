import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/data/events/providers/events_repository_provider.dart';
import 'package:relog/domain/events/use_case/get_calendar_use_case.dart';

final getCalendarUseCaseProvider = Provider<GetCalendarUseCase>((ref) {
  final repo = ref.watch(eventsRepositoryProvider);
  return GetCalendarUseCase(repo);
});

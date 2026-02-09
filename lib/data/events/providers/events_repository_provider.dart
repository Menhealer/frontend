import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/network/providers/dio_provider.dart';
import 'package:relog/data/events/repository/events_repository_impl.dart';
import 'package:relog/domain/events/repository/events_repository.dart';

final eventsRepositoryProvider = Provider<EventsRepository>((ref) {
  final authDio = ref.watch(authDioProvider);

  return EventsRepositoryImpl(authDio);
});
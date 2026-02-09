import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/presentation/events/events_state.dart';
import 'package:relog/presentation/events/events_view_model.dart';

final eventsViewModelProvider = NotifierProvider<EventsViewModel, EventsState>(
  EventsViewModel.new,
);
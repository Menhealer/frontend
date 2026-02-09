import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/presentation/events/detail/event_detail_state.dart';
import 'package:relog/presentation/events/detail/event_detail_view_model.dart';
import 'package:relog/presentation/events/events_state.dart';
import 'package:relog/presentation/events/events_view_model.dart';
import 'package:relog/presentation/events/write/event_write_state.dart';
import 'package:relog/presentation/events/write/event_write_view_model.dart';

final eventsViewModelProvider = NotifierProvider<EventsViewModel, EventsState>(
  EventsViewModel.new,
);

final eventDetailViewModelProvider = NotifierProvider.autoDispose<EventDetailViewModel, EventDetailState>(
  EventDetailViewModel.new,
);

final eventWriteViewModelProvider = NotifierProvider.autoDispose<EventWriteViewModel, EventWriteState>(
  EventWriteViewModel.new,
);
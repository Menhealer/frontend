import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/domain/events/model/event_detail.dart';
import 'package:relog/domain/events/use_case/event_delete_use_case.dart';
import 'package:relog/domain/events/use_case/get_event_use_case.dart';
import 'package:relog/domain/events/use_case/providers/events_use_case_providers.dart';
import 'package:relog/presentation/events/detail/event_detail_state.dart';

class EventDetailViewModel extends Notifier<EventDetailState> {
  late final GetEventUseCase _getEventUseCase;
  late final EventDeleteUseCase _eventDeleteUseCase;

  int? _loadedId;

  @override
  EventDetailState build() {
    _getEventUseCase = ref.read(getEventUseCaseProvider);
    _eventDeleteUseCase = ref.read(eventDeleteUseCaseProvider);
    return EventDetailState(isLoading: false);
  }

  Future<void> loadEvent(int id, {bool force = false}) async {
    if (!force && _loadedId == id && state.event != null) return;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final event = await _getEventUseCase.execute(id);
      state = state.copyWith(isLoading: false, event: event);
      _loadedId = id;
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '일정 정보를 불러오는 중\n알 수 없는 오류가 발생했습니다.',
      );
    }
  }

  void clearError() => state = state.copyWith(errorMessage: null);

  void applyUpdatedEvent(EventDetail updated) {
    state = state.copyWith(event: updated);
  }

  Future<bool> deleteEvent() async {
    final id = state.event?.id;
    if (id == null) return false;

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final ok = await _eventDeleteUseCase.execute(id);

      state = state.copyWith(isLoading: false);
      return ok;
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
      return false;
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: '일정 삭제 중\n알 수 없는 오류가 발생했습니다.',
      );
      return false;
    }
  }
}
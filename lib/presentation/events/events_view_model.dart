import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/state/app_mutation_provider.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/events/model/calendar.dart';
import 'package:relog/domain/events/model/event_detail.dart';
import 'package:relog/domain/events/use_case/get_calendar_use_case.dart';
import 'package:relog/domain/events/use_case/providers/events_use_case_providers.dart';
import 'package:relog/presentation/events/events_state.dart';
import 'package:relog/presentation/events/model/calendar_item.dart';

class EventsViewModel extends Notifier<EventsState> {
  late final GetCalendarUseCase _getCalendarUseCase;

  // Prevent duplicate calendar loads per (year, month)
  final Map<String, Future<void>> _inFlightLoads = {};

  @override
  EventsState build() {
    _getCalendarUseCase = ref.read(getCalendarUseCaseProvider);

    ref.listen<AppMutation?>(appMutationProvider, (prev, next) async {
      if (next == null) return;

      if (next is FriendUpserted) {
        await _invalidateBirthdayAffectedMonths(
          prevBirthday: next.prevBirthday,
          nextBirthday: next.friend.birthday,
        );
      }

      if (next is FriendDeleted) {
        await _invalidateBirthdayAffectedMonths(
          prevBirthday: next.birthday,
          nextBirthday: null,
        );
      }
    });

    ref.onDispose(_inFlightLoads.clear);

    final now = DateTime.now();
    final focused = DateTime(now.year, now.month, 1);
    final selected = DateTime(now.year, now.month, now.day);

    return EventsState(
      isLoading: false,
      focusedMonth: focused,
      selectedDate: selected,
      itemsByDate: const {},
      itemsForSelected: const [],
      loadedYearMonths: const {},
      dirtyYearMonths: const {},
    );
  }

  String _ymKey(int year, int month) => '$year-${month.toString().padLeft(2, '0')}';

  Future<void> ensureCalendarLoaded(int year, int month) async {
    final key = _ymKey(year, month);

    // If there is already a request in-flight for this month, await it.
    final inFlight = _inFlightLoads[key];
    if (inFlight != null) {
      await inFlight;
      return;
    }

    final isLoaded = state.loadedYearMonths.contains(key);
    final isDirty = state.dirtyYearMonths.contains(key);
    if (isLoaded && !isDirty) return;

    // Start a new in-flight load for this month.
    final future = loadCalendar(year, month);
    _inFlightLoads[key] = future;

    try {
      await future;
    } finally {
      // Always clear in-flight marker.
      final current = _inFlightLoads[key];
      if (identical(current, future)) {
        _inFlightLoads.remove(key);
      }
    }
  }

  void invalidateCalendarMonth(int year, int month) {
    final key = _ymKey(year, month);

    // Already invalidated
    if (state.dirtyYearMonths.contains(key) && !state.loadedYearMonths.contains(key)) {
      return;
    }

    final dirty = {...state.dirtyYearMonths, key};

    final loaded = {...state.loadedYearMonths}..remove(key);

    final mm = month.toString().padLeft(2, '0');
    final prefix = '$year-$mm-';

    final nextMap = Map<String, List<CalendarItem>>.from(state.itemsByDate);
    nextMap.removeWhere((date, _) => date.startsWith(prefix));

    state = state.copyWith(
      dirtyYearMonths: dirty,
      loadedYearMonths: loaded,
      itemsByDate: nextMap,
      itemsForSelected: _itemsForDate(state.selectedDate, nextMap),
    );
  }

  void setFocusedMonth(DateTime month, {bool alsoSelectFirstDay = false}) {
    final m = DateTime(month.year, month.month, 1);
    final nextSelected = alsoSelectFirstDay
        ? DateTime(m.year, m.month, 1)
        : state.selectedDate;

    state = state.copyWith(
      focusedMonth: m,
      selectedDate: nextSelected,
      itemsForSelected: _itemsForDate(nextSelected, state.itemsByDate),
    );
  }

  void setSelectedDate(DateTime date) {
    final d = DateTime(date.year, date.month, date.day);
    state = state.copyWith(
      selectedDate: d,
      itemsForSelected: _itemsForDate(d, state.itemsByDate),
    );
  }

  Future<void> loadCalendar(int year, int month) async {
    final key = _ymKey(year, month);

    // If another call is already loading this month, don't start a duplicate.
    final inFlight = _inFlightLoads[key];
    if (inFlight != null) {
      await inFlight;
      return;
    }

    if (state.isLoading) return;
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final calendar = await _getCalendarUseCase.execute(year, month);

      final merged = _mergeCalendarIntoMap(state.itemsByDate, calendar);

      final loaded = {...state.loadedYearMonths, key};
      final dirty = {...state.dirtyYearMonths}..remove(key);

      final selectedItems = _itemsForDate(state.selectedDate, merged);

      state = state.copyWith(
        isLoading: false,
        itemsByDate: merged,
        itemsForSelected: selectedItems,
        loadedYearMonths: loaded,
        dirtyYearMonths: dirty,
      );
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "일정 목록을 불러오는 중\n알 수 없는 오류가 발생했습니다.",
      );
    }
  }

  List<CalendarItem> _itemsForDate(DateTime date, Map<String, List<CalendarItem>> itemsByDate) {
    final ymd = ymdHyphen(date);
    return itemsByDate[ymd] ?? const <CalendarItem>[];
  }

  Map<String, List<CalendarItem>> _mergeCalendarIntoMap(
      Map<String, List<CalendarItem>> base,
      Calendar calendar,
      ) {
    final next = Map<String, List<CalendarItem>>.from(base);

    for (final day in calendar.days) {
      final items = <CalendarItem>[
        for (final e in day.events) CalendarItem.fromEvent(e),
        for (final f in day.birthdays) CalendarItem.fromBirthday(f),
      ];

      items.sort((a, b) {
        final typeCmp = a.type.index.compareTo(b.type.index);
        if (typeCmp != 0) return typeCmp;
        return a.id.compareTo(b.id);
      });

      next[day.date] = items;
    }

    return next;
  }

  void applyUpsertEvent(EventDetail updated) {
    final ymd = updated.eventDate; // 'YYYY-MM-DD'

    final nextMap = Map<String, List<CalendarItem>>.from(state.itemsByDate);

    nextMap.updateAll((_, list) {
      return list
          .where((it) => !(it.type == CalendarItemType.event && it.id == updated.id))
          .toList();
    });

    final current = nextMap[ymd] ?? const <CalendarItem>[];
    final nextList = [...current];

    final idx = nextList.indexWhere(
          (it) => it.type == CalendarItemType.event && it.id == updated.id,
    );

    final item = CalendarItem.fromEvent(updated);

    if (idx == -1) {
      nextList.add(item);
    } else {
      nextList[idx] = item;
    }

    nextList.sort((a, b) {
      final typeCmp = a.type.index.compareTo(b.type.index);
      if (typeCmp != 0) return typeCmp;
      return a.id.compareTo(b.id);
    });

    nextMap[ymd] = nextList;

    state = state.copyWith(
      itemsByDate: nextMap,
      itemsForSelected: _itemsForDate(state.selectedDate, nextMap),
    );
  }

  void applyDeleteEvent(int eventId) {
    final nextMap = Map<String, List<CalendarItem>>.from(state.itemsByDate);

    nextMap.updateAll((_, list) {
      return list
          .where((it) => !(it.type == CalendarItemType.event && it.id == eventId))
          .toList();
    });

    state = state.copyWith(
      itemsByDate: nextMap,
      itemsForSelected: _itemsForDate(state.selectedDate, nextMap),
    );
  }

  Future<void> _invalidateBirthdayAffectedMonths({
    required String? prevBirthday,
    required String? nextBirthday,
  }) async {
    final months = <DateTime>{};

    DateTime? toMonthInFocusedYear(String? ymd) {
      if (ymd == null || ymd.trim().isEmpty) return null;
      final parts = ymd.split('-');
      if (parts.length < 2) return null;

      final m = int.tryParse(parts[1]);
      if (m == null) return null;

      final y = state.focusedMonth.year;
      return DateTime(y, m, 1);
    }

    final prevM = toMonthInFocusedYear(prevBirthday);
    final nextM = toMonthInFocusedYear(nextBirthday);

    if (prevM != null) months.add(prevM);
    if (nextM != null) months.add(nextM);
    if (months.isEmpty) months.add(state.focusedMonth);

    for (final m in months) {
      invalidateCalendarMonth(m.year, m.month);
    }

    // 포커스 달이 영향을 받았으면 즉시 재호출
    final focusedKey = _ymKey(state.focusedMonth.year, state.focusedMonth.month);
    if (state.dirtyYearMonths.contains(focusedKey)) {
      await ensureCalendarLoaded(state.focusedMonth.year, state.focusedMonth.month);
    }
  }
}
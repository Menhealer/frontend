import 'package:relog/presentation/events/model/calendar_item.dart';

class EventsState {
  final bool isLoading;
  final String? errorMessage;

  final DateTime focusedMonth; // 해당 월의 1일
  final DateTime selectedDate; // 선택된 날짜

  final Map<String, List<CalendarItem>> itemsByDate;

  final List<CalendarItem> itemsForSelected;

  final Set<String> loadedYearMonths;

  EventsState({
    required this.isLoading,
    this.errorMessage,
    required this.focusedMonth,
    required this.selectedDate,
    this.itemsByDate = const {},
    this.itemsForSelected = const [],
    this.loadedYearMonths = const {},
  });

  EventsState copyWith({
    bool? isLoading,
    String? errorMessage,
    DateTime? focusedMonth,
    DateTime? selectedDate,
    Map<String, List<CalendarItem>>? itemsByDate,
    List<CalendarItem>? itemsForSelected,
    Set<String>? loadedYearMonths,
  }) {
    return EventsState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      focusedMonth: focusedMonth ?? this.focusedMonth,
      selectedDate: selectedDate ?? this.selectedDate,
      itemsByDate: itemsByDate ?? this.itemsByDate,
      itemsForSelected: itemsForSelected ?? this.itemsForSelected,
      loadedYearMonths: loadedYearMonths ?? this.loadedYearMonths,
    );
  }
}
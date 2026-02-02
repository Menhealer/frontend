import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/domain/calendar.dart';
import 'package:relog/presentation/calendar/widgets/event_card.dart';

class SelectedDayEventList extends StatelessWidget {
  final void Function(int id) onTapPresent;
  final void Function(int id) onTapEventDetail;
  final List<Calendar> events;

  const SelectedDayEventList({
    super.key,
    required this.onTapPresent,
    required this.onTapEventDetail,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: ColorStyles.black42)),
      ),
      child: events.isEmpty
        ? Center(
            child: Text(
              '선택한 날짜에 일정이 없어요',
              style: TextStyles.normalTextRegular.copyWith(color: ColorStyles.gray86),
            ),
          )
        : ListView.separated(
            itemCount: events.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final event = events[index];
              return GestureDetector(
                onTap: event.category == 'event'
                  ? () => onTapEventDetail(event.id)
                  : () => onTapPresent(event.friendId),
                behavior: HitTestBehavior.opaque,
                child: EventCard(event: event),
              );
            }
          ),
    );
  }
}
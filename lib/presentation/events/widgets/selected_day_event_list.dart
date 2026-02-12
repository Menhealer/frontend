import 'package:flutter/material.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/presentation/events/model/calendar_item.dart';
import 'package:relog/presentation/events/widgets/event_card.dart';

class SelectedDayEventList extends StatelessWidget {
  final void Function(Friend friend) onTapGift;
  final void Function(int id) onTapEventDetail;
  final List<CalendarItem> events;

  const SelectedDayEventList({
    super.key,
    required this.onTapGift,
    required this.onTapEventDetail,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
            itemCount: events.length + 1,
            separatorBuilder: (_, index) => SizedBox(height: index == 0 ? 0 : 16),
            itemBuilder: (context, index) {
              if (index == 0) return const SizedBox(height: 16);

              final event = events[index - 1];
              return GestureDetector(
                onTap: event.type == CalendarItemType.event
                    ? () => onTapEventDetail(event.id)
                    : () => onTapGift(
                          Friend(
                            id: event.friendId,
                            name: event.friendName,
                            score: event.score ?? 0,
                            group: event.group,
                            birthday: event.birthday,
                          ),
                        ),
                behavior: HitTestBehavior.opaque,
                child: EventCard(event: event),
              );
            },
          ),
    );
  }
}
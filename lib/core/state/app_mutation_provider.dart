import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/domain/events/model/event_detail.dart';
import 'package:relog/domain/friends/model/friend.dart';

sealed class AppMutation {
  const AppMutation();
}

class EventUpserted extends AppMutation {
  final EventDetail event;
  final int oldFriendId;
  const EventUpserted({
    required this.event,
    required this.oldFriendId,
  });
}

class EventDeleted extends AppMutation {
  final int eventId;
  final int friendId;
  const EventDeleted({required this.eventId, required this.friendId});
}

final appMutationProvider =
NotifierProvider<AppMutationNotifier, AppMutation?>(AppMutationNotifier.new);

class AppMutationNotifier extends Notifier<AppMutation?> {
  @override
  AppMutation? build() => null;

  void emit(AppMutation m) => state = m;

  void eventUpsert({required EventDetail event, required int oldFriendId}) =>
      emit(EventUpserted(event: event, oldFriendId: oldFriendId));

  void eventDelete({required int eventId, required int friendId}) =>
      emit(EventDeleted(eventId: eventId, friendId: friendId));
}

class FriendUpserted extends AppMutation {
  final Friend friend;
  final String? prevBirthday;
  const FriendUpserted({required this.friend, this.prevBirthday});
}

class FriendDeleted extends AppMutation {
  final int friendId;
  final String? birthday;
  const FriendDeleted({required this.friendId, this.birthday});
}
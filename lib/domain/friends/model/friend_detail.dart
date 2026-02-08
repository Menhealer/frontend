import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/event/model/event.dart';
import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/domain/gifts/model/gift.dart';

part 'friend_detail.freezed.dart';
part 'friend_detail.g.dart';

@freezed
abstract class FriendDetail with _$FriendDetail {
  const factory FriendDetail({
    required Friend friend,
    List<Event>? recentEvents,
    List<Gift>? giftHistory,
  }) = _FriendDetail;

  factory FriendDetail.fromJson(Map<String, dynamic> json) =>
      _$FriendDetailFromJson(json);
}
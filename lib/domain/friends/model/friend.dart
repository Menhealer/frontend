import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend.freezed.dart';
part 'friend.g.dart';

@freezed
abstract class Friend with _$Friend {
  const factory Friend({
    required int id,
    required String name,
    required int score,
  }) = _Friend;

  factory Friend.fromJson(Map<String, dynamic> json) =>
      _$FriendFromJson(json);
}
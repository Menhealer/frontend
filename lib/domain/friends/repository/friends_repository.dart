import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/domain/friends/model/friend_write_request.dart';

abstract class FriendsRepository {
  Future<List<Friend>> getFriends();
  Future<bool> friendWrite(FriendWriteRequest request);
  Future<bool> friendEdit(FriendWriteRequest request, int friendId);
  Future<bool> checkName(String name);
}
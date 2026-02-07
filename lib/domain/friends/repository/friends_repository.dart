import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/domain/friends/model/friend_detail.dart';
import 'package:relog/domain/friends/model/friend_edit_request.dart';
import 'package:relog/domain/friends/model/friend_write_request.dart';

abstract class FriendsRepository {
  Future<List<Friend>> getFriends();
  Future<FriendDetail> getFriendDetail(int friendId);
  Future<bool> friendWrite(FriendWriteRequest request);
  Future<bool> friendEdit(FriendEditRequest request, int friendId);
  Future<bool> checkName(String name);
}
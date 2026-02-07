import 'package:relog/domain/friends/model/friend.dart';

abstract class FriendsRepository {
  Future<List<Friend>?> getFriends();
}
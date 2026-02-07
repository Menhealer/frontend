import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/domain/friends/model/friend_edit_request.dart';
import 'package:relog/domain/friends/repository/friends_repository.dart';

class FriendEditUseCase {
  final FriendsRepository _friendsRepository;
  FriendEditUseCase(this._friendsRepository);

  Future<Friend?> execute(FriendEditRequest request, int friendId) async {
    return await _friendsRepository.friendEdit(request, friendId);
  }
}
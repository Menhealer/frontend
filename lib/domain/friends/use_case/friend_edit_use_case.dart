import 'package:relog/domain/friends/model/friend_write_request.dart';
import 'package:relog/domain/friends/repository/friends_repository.dart';

class FriendEditUseCase {
  final FriendsRepository _friendsRepository;
  FriendEditUseCase(this._friendsRepository);

  Future<bool> execute(FriendWriteRequest request, int friendId) async {
    return await _friendsRepository.friendEdit(request, friendId);
  }
}
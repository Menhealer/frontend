import 'package:relog/domain/friends/repository/friends_repository.dart';

class FriendDeleteUseCase {
  final FriendsRepository _friendsRepository;
  FriendDeleteUseCase(this._friendsRepository);

  Future<bool> execute(int friendId) async {
    return await _friendsRepository.friendDelete(friendId);
  }
}
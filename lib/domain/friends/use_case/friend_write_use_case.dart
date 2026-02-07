import 'package:relog/domain/friends/model/friend_write_request.dart';
import 'package:relog/domain/friends/repository/friends_repository.dart';

class FriendWriteUseCase {
  final FriendsRepository _friendsRepository;
  FriendWriteUseCase(this._friendsRepository);

  Future<bool> execute(FriendWriteRequest request) async {
    return await _friendsRepository.friendWrite(request);
  }
}
import 'package:relog/domain/friends/model/friend_write_request.dart';
import 'package:relog/domain/friends/repository/friends_repository.dart';

class WriteFriendUseCase {
  final FriendsRepository _friendsRepository;
  WriteFriendUseCase(this._friendsRepository);

  Future<bool> execute(FriendWriteRequest request) async {
    return await _friendsRepository.writeFriend(request);
  }
}
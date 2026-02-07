import 'package:relog/domain/friends/model/friend_detail.dart';
import 'package:relog/domain/friends/repository/friends_repository.dart';

class GetFriendDetailUseCase {
  final FriendsRepository _friendsRepository;
  GetFriendDetailUseCase(this._friendsRepository);

  Future<FriendDetail> execute(int friendId) async {
    return await _friendsRepository.getFriendDetail(friendId);
  }
}
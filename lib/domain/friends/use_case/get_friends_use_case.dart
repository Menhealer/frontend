import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/domain/friends/repository/friends_repository.dart';

class GetFriendsUseCase {
  final FriendsRepository _friendsRepository;
  GetFriendsUseCase(this._friendsRepository);

  Future<List<Friend>?> execute() async {
    return await _friendsRepository.getFriends();
  }
}
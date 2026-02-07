import 'package:relog/domain/friends/repository/friends_repository.dart';

class FriendNameCheckUseCase {
  final FriendsRepository _friendsRepository;
  FriendNameCheckUseCase(this._friendsRepository);

  Future<bool> execute(String name) async {
    return await _friendsRepository.checkName(name);
  }
}
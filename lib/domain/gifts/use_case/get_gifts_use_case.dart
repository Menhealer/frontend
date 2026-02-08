import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/domain/gifts/repository/gifts_repository.dart';

class GetGiftsUseCase {
  final GiftsRepository _giftsRepository;
  GetGiftsUseCase(this._giftsRepository);

  Future<List<GiftDetail>> execute(int friendId) async {
    return await _giftsRepository.getGifts(friendId);
  }
}
import 'package:relog/domain/gifts/repository/gifts_repository.dart';

class GiftDeleteUseCase {
  final GiftsRepository _giftsRepository;
  GiftDeleteUseCase(this._giftsRepository);

  Future<bool> execute(int giftId) async {
    return await _giftsRepository.giftDelete(giftId);
  }
}
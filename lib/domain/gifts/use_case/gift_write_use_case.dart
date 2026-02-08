import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/domain/gifts/model/gift_write_request.dart';
import 'package:relog/domain/gifts/repository/gifts_repository.dart';

class GiftWriteUseCase {
  final GiftsRepository _giftsRepository;
  GiftWriteUseCase(this._giftsRepository);

  Future<GiftDetail?> execute(GiftWriteRequest request) async {
    return await _giftsRepository.giftWrite(request);
  }
}
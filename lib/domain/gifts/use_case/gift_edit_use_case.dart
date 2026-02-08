import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/domain/gifts/model/gift_edit_request.dart';
import 'package:relog/domain/gifts/repository/gifts_repository.dart';

class GiftEditUseCase {
  final GiftsRepository _giftsRepository;
  GiftEditUseCase(this._giftsRepository);

  Future<GiftDetail?> execute(GiftEditRequest request, int giftId) async {
    return await _giftsRepository.giftEdit(request, giftId);
  }
}
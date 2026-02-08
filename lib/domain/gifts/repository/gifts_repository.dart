import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/domain/gifts/model/gift_edit_request.dart';
import 'package:relog/domain/gifts/model/gift_write_request.dart';

abstract class GiftsRepository {
  Future<List<GiftDetail>> getGifts();
  Future<GiftDetail?> giftWrite(GiftWriteRequest request);
  Future<GiftDetail?> giftEdit(GiftEditRequest request, int giftId);
}
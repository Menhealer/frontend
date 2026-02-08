import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/domain/gifts/model/gift_edit_request.dart';
import 'package:relog/domain/gifts/model/gift_write_request.dart';

abstract class GiftsRepository {
  Future<List<GiftDetail>> getGifts(int friendId);
  Future<GiftDetail?> giftWrite(GiftWriteRequest request);
  Future<GiftDetail?> giftEdit(GiftEditRequest request, int giftId);
  Future<bool> giftDelete(int giftId);
}
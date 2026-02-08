import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/domain/gifts/model/gift_write_request.dart';

abstract class GiftsRepository {
  Future<List<GiftDetail>> getGifts();
  Future<GiftDetail?> giftWrite(GiftWriteRequest request);
}
import 'package:relog/domain/gifts/model/gift_detail.dart';

abstract class GiftsRepository {
  Future<List<GiftDetail>> getGifts();
}
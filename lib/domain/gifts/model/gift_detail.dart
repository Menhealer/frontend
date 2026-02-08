import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/gifts/enum/direction.dart';
import 'package:relog/domain/gifts/enum/gift_type.dart';

part 'gift_detail.freezed.dart';
part 'gift_detail.g.dart';

@freezed
abstract class GiftDetail with _$GiftDetail {
  const factory GiftDetail({
    required int id,
    required int price,
    required String giftDate,
    required GiftType giftType,
    required Direction direction,
    String? description,
    required int friendId,
    required String friendName,
  }) = _GiftDetail;

  factory GiftDetail.fromJson(Map<String, dynamic> json) =>
      _$GiftDetailFromJson(json);
}
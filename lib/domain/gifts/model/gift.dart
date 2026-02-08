import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/gifts/enum/direction.dart';
import 'package:relog/domain/gifts/enum/gift_type.dart';

part 'gift.freezed.dart';
part 'gift.g.dart';

@freezed
abstract class Gift with _$Gift {
  const factory Gift({
    required int giftId,
    required int price,
    required String giftDate,
    required GiftType giftType,
    required Direction direction,
    String? description,
  }) = _Gift;

  factory Gift.fromJson(Map<String, dynamic> json) =>
      _$GiftFromJson(json);
}
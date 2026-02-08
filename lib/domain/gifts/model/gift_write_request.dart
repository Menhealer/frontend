import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/gifts/enum/direction.dart';
import 'package:relog/domain/gifts/enum/gift_type.dart';

part 'gift_write_request.freezed.dart';
part 'gift_write_request.g.dart';

@freezed
abstract class GiftWriteRequest with _$GiftWriteRequest {
  const factory GiftWriteRequest({
    required int price,
    required String giftDate,
    required GiftType giftType,
    required Direction direction,
    String? description,
    required int friendId,
  }) = _GiftWriteRequest;

  factory GiftWriteRequest.fromJson(Map<String, dynamic> json) =>
      _$GiftWriteRequestFromJson(json);
}
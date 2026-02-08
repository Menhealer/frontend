import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/gifts/enum/direction.dart';
import 'package:relog/domain/gifts/enum/gift_type.dart';

part 'gift_edit_request.freezed.dart';
part 'gift_edit_request.g.dart';

@freezed
abstract class GiftEditRequest with _$GiftEditRequest {
  const factory GiftEditRequest({
    int? price,
    String? giftDate,
    GiftType? giftType,
    Direction? direction,
    String? description,
    int? friendId,
  }) = _GiftEditRequest;

  factory GiftEditRequest.fromJson(Map<String, dynamic> json) =>
      _$GiftEditRequestFromJson(json);
}
import 'package:relog/domain/gifts/enum/direction.dart';
import 'package:relog/domain/gifts/enum/gift_type.dart';

class GiftDetail {
  final int id;
  final int price;
  final String giftDate;
  final GiftType giftType;
  final Direction direction;
  final String? description;
  final int friendId;
  final String friendName;

  GiftDetail({
    required this.id,
    required this.price,
    required this.giftDate,
    required this.giftType,
    required this.direction,
    this.description,
    required this.friendId,
    required this.friendName
  });
}
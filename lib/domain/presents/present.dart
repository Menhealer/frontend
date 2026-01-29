import 'package:relog/domain/presents/enum/present_tag.dart';

class Present {
  final int id;
  final int friendId;
  final String friendName;
  final DateTime date;
  final PresentTag tag;
  final int price;
  final String? info;
  final PresentDirection isGive;

  Present({
    required this.id,
    required this.friendId,
    required this.friendName,
    required this.date,
    required this.tag,
    required this.price,
    required this.info,
    required this.isGive,
  });
}
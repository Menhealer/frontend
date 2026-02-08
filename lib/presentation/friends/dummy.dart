import 'package:relog/domain/gifts/enum/direction.dart';
import 'package:relog/domain/gifts/enum/gift_type.dart';
import 'package:relog/domain/gifts/model/gift_detail.dart';

final List<String> summaryDummy = [
  '최근 3개월 기준, 햄스터님과의 만남은 이어지고 있지만 만남 이후 만족도는 낮은 편이에요.\n\n감정 기록에서는 피로와 아쉬움이 반복적으로 나타났고, 선물 기록 또한 주꾸미님의 제공 비중이 더 높게 기록됐어요.\n\n햄스터님에게 주꾸미님이 먼저 제공한 기록이 더 많았고, 주고받음의 균형은 다소 한쪽으로 기울어져 있었어요.\n\n이 관계는 현재 유지되고는 있지만, 주꾸미님에게 회복을 주는 관계는 아니에요. 기록상으로는 노력 대비 만족도가 낮은 상태로 판단돼요.',
  '- 당분간은 만남 빈도를 줄이고, 관계를 관찰하는 것이 좋아 보여요.\n- 추가적인 선물이나 관계 유지를 위한 노력은 지금 시점에서는 효과가 크지 않을 가능성이 있어요.\n-이 관계가 계속 이어질 경우, 만남 이후 감정 상태를 기준으로 재평가하는 것을 권장해요.\n\n👉 관계 방향성 제안:\n1~2개월 거리 두기 후 재정산 권장',
];

final List<GiftDetail> presentList = [
  GiftDetail(
    id: 1,
    price: 30000,
    giftDate: '2025-09-22',
    giftType: GiftType.BIRTHDAY,
    direction: Direction.GIVEN,
    friendId: 1,
    friendName: '햄스터'
  ),
  GiftDetail(
    id: 1,
    price: 27000,
    giftDate: '2025-12-09',
    giftType: GiftType.OTHER,
    direction: Direction.RECEIVED,
      friendId: 1,
      friendName: '햄스터'
  ),
  GiftDetail(
      id: 1,
      price: 30000,
      giftDate: '2025-09-22',
      giftType: GiftType.BIRTHDAY,
      direction: Direction.GIVEN,
      friendId: 1,
      friendName: '햄스터'
  ),
  GiftDetail(
      id: 1,
      price: 27000,
      giftDate: '2025-12-09',
      giftType: GiftType.OTHER,
      direction: Direction.RECEIVED,
      friendId: 1,
      friendName: '햄스터'
  ),
  GiftDetail(
      id: 1,
      price: 30000,
      giftDate: '2025-09-22',
      giftType: GiftType.BIRTHDAY,
      direction: Direction.GIVEN,
      friendId: 1,
      friendName: '햄스터'
  ),
  GiftDetail(
      id: 1,
      price: 27000,
      giftDate: '2025-12-09',
      giftType: GiftType.OTHER,
      direction: Direction.RECEIVED,
      friendId: 1,
      friendName: '햄스터'
  ),
  GiftDetail(
      id: 1,
      price: 30000,
      giftDate: '2025-09-22',
      giftType: GiftType.BIRTHDAY,
      direction: Direction.GIVEN,
      friendId: 1,
      friendName: '햄스터'
  ),
  GiftDetail(
      id: 1,
      price: 27000,
      giftDate: '2025-12-09',
      giftType: GiftType.OTHER,
      direction: Direction.RECEIVED,
      friendId: 1,
      friendName: '햄스터'
  ),
  GiftDetail(
      id: 1,
      price: 30000,
      giftDate: '2025-09-22',
      giftType: GiftType.BIRTHDAY,
      direction: Direction.GIVEN,
      friendId: 1,
      friendName: '햄스터'
  ),
  GiftDetail(
      id: 1,
      price: 27000,
      giftDate: '2025-12-09',
      giftType: GiftType.OTHER,
      direction: Direction.RECEIVED,
      friendId: 1,
      friendName: '햄스터'
  ),
  GiftDetail(
      id: 1,
      price: 30000,
      giftDate: '2025-09-22',
      giftType: GiftType.BIRTHDAY,
      direction: Direction.GIVEN,
      friendId: 1,
      friendName: '햄스터'
  ),
  GiftDetail(
      id: 1,
      price: 27000,
      giftDate: '2025-12-09',
      giftType: GiftType.OTHER,
      direction: Direction.RECEIVED,
      friendId: 1,
      friendName: '햄스터'
  ),
];
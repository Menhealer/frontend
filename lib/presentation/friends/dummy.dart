import 'package:relog/domain/event.dart';
import 'package:relog/domain/friends/friend.dart';
import 'package:relog/domain/friends/friend_detail.dart';
import 'package:relog/domain/presents/present.dart';

final List<Friend> allFriends = [
  Friend(id: 1, name: '햄스터', score: 85),
  Friend(id: 2, name: '고양이', score: 42),
  Friend(id: 3, name: '토끼', score: -10),
  Friend(id: 4, name: '여우', score: 67),
  Friend(id: 5, name: '강아지', score: 95),
  Friend(id: 6, name: '판다', score: 12),
  Friend(id: 7, name: '수달', score: -45),
  Friend(id: 8, name: '늑대', score: -80),
  Friend(id: 9, name: '너구리', score: 5),
  Friend(id: 10, name: '고슴도치', score: 0),
];

final List<FriendDetail> dummyFriendDetails = [
  FriendDetail(
    id: 1,
    name: '햄스터',
    score: 85,
    group: '동아리',
    birthday: DateTime(2024, 10, 12),
    eventList: [
      Event(
        id: 1,
        date: DateTime(2024, 3, 12),
        name: '동아리 임원 회의',
        score: 1,
      ),
      Event(
        id: 2,
        date: DateTime(2024, 5, 3),
        name: '회식',
        score: 3,
      ),
    ],
    presentList: [
      Present(
        id: 1,
        date: DateTime(2025, 9, 22),
        tag: '생일선물',
        price: 30000,
        info: '배민 상품권',
        isGive: true,
      ),
      Present(
        id: 1,
        date: DateTime(2025, 12, 9),
        tag: '생일선물',
        price: 27000,
        info: null,
        isGive: false,
      ),
    ],
  ),

  FriendDetail(
    id: 2,
    name: '고양이',
    score: 42,
    group: null,
    birthday: DateTime(2024, 1, 15),
    eventList: [
      Event(
        id: 3,
        date: DateTime(2024, 2, 20),
        name: '점심 식사',
        score: 3,
      ),
    ],
    presentList: [],
  ),

  FriendDetail(
    id: 3,
    name: '토끼',
    score: -10,
    group: null,
    birthday: null,
    eventList: [],
    presentList: [
      Present(
        id: 2,
        date: DateTime(2022, 12, 25),
        tag: '크리스마스',
        price: 15000,
        info: null,
        isGive: true,
      ),
      Present(
        id: 3,
        date: DateTime(2023, 1, 5),
        tag: '답례',
        price: 12000,
        info: '받음',
        isGive: false,
      ),
    ],
  ),

  FriendDetail(
    id: 4,
    name: '여우',
    score: 67,
    group: null,
    birthday: null,
    eventList: [
      Event(
        id: 4,
        date: DateTime(2024, 4, 10),
        name: '전시회',
        score: 4,
      ),
      Event(
        id: 5,
        date: DateTime(2024, 6, 1),
        name: '저녁 식사',
        score: 5,
      ),
      Event(
        id: 6,
        date: DateTime(2024, 6, 15),
        name: '산책',
        score: 3,
      ),
    ],
    presentList: [],
  ),

  FriendDetail(
    id: 5,
    name: '강아지',
    score: 95,
    group: null,
    birthday: null,
    eventList: [
      Event(
        id: 7,
        date: DateTime(2024, 1, 1),
        name: '새해 첫 만남',
        score: 5,
      ),
    ],
    presentList: [
      Present(
        id: 4,
        date: DateTime(2023, 11, 3),
        tag: '생일',
        price: 50000,
        info: '커스텀 제작',
        isGive: true,
      ),
      Present(
        id: 5,
        date: DateTime(2023, 11, 10),
        tag: '답례',
        price: 40000,
        info: null,
        isGive: false,
      ),
    ],
  ),

  FriendDetail(
    id: 6,
    name: '판다',
    score: 12,
    group: null,
    birthday: null,
    eventList: [
      Event(
        id: 8,
        date: DateTime(2024, 5, 20),
        name: '오랜만에 통화',
        score: 2,
      ),
    ],
    presentList: [],
  ),

  FriendDetail(
    id: 7,
    name: '수달',
    score: -45,
    group: '동아리',
    birthday: DateTime(2024, 4, 22),
    eventList: [
      Event(
        id: 9,
        date: DateTime(2024, 2, 1),
        name: '말다툼',
        score: -3,
      ),
    ],
    presentList: [],
  ),

  FriendDetail(
    id: 8,
    name: '늑대',
    score: -80,
    group: null,
    birthday: DateTime(2024, 6, 28),
    eventList: [],
    presentList: [],
  ),

  FriendDetail(
    id: 9,
    name: '너구리',
    score: 5,
    group: '학생회',
    birthday: null,
    eventList: [],
    presentList: [
      Present(
        id: 6,
        date: DateTime(2023, 8, 30),
        tag: '생일',
        price: 20000,
        info: null,
        isGive: true,
      ),
    ],
  ),

  FriendDetail(
    id: 10,
    name: '고슴도치',
    score: 0,
    group: null,
    birthday: null,
    eventList: [],
    presentList: [],
  ),
];

final List<String> summaryDummy = [
  '최근 3개월 기준, 햄스터님과의 만남은 이어지고 있지만 만남 이후 만족도는 낮은 편이에요.\n\n감정 기록에서는 피로와 아쉬움이 반복적으로 나타났고, 선물 기록 또한 주꾸미님의 제공 비중이 더 높게 기록됐어요.\n\n햄스터님에게 주꾸미님이 먼저 제공한 기록이 더 많았고, 주고받음의 균형은 다소 한쪽으로 기울어져 있었어요.\n\n이 관계는 현재 유지되고는 있지만, 주꾸미님에게 회복을 주는 관계는 아니에요. 기록상으로는 노력 대비 만족도가 낮은 상태로 판단돼요.',
  '- 당분간은 만남 빈도를 줄이고, 관계를 관찰하는 것이 좋아 보여요.\n- 추가적인 선물이나 관계 유지를 위한 노력은 지금 시점에서는 효과가 크지 않을 가능성이 있어요.\n-이 관계가 계속 이어질 경우, 만남 이후 감정 상태를 기준으로 재평가하는 것을 권장해요.\n\n👉 관계 방향성 제안:\n1~2개월 거리 두기 후 재정산 권장',
];

final List<Present> presentList = [
  Present(
    id: 1,
    date: DateTime(2025, 9, 22),
    tag: '생일선물',
    price: 30000,
    info: '배민 상품권',
    isGive: true,
  ),
  Present(
    id: 1,
    date: DateTime(2025, 12, 9),
    tag: '생일선물',
    price: 27000,
    info: null,
    isGive: false,
  ),
  Present(
    id: 1,
    date: DateTime(2025, 9, 22),
    tag: '생일선물',
    price: 30000,
    info: '배민 상품권',
    isGive: true,
  ),
  Present(
    id: 1,
    date: DateTime(2025, 12, 9),
    tag: '생일선물',
    price: 27000,
    info: null,
    isGive: false,
  ),
  Present(
    id: 1,
    date: DateTime(2025, 9, 22),
    tag: '생일선물',
    price: 30000,
    info: '배민 상품권',
    isGive: true,
  ),
  Present(
    id: 1,
    date: DateTime(2025, 12, 9),
    tag: '생일선물',
    price: 27000,
    info: null,
    isGive: false,
  ),
  Present(
    id: 1,
    date: DateTime(2025, 9, 22),
    tag: '생일선물',
    price: 30000,
    info: '배민 상품권',
    isGive: true,
  ),
  Present(
    id: 1,
    date: DateTime(2025, 12, 9),
    tag: '생일선물',
    price: 27000,
    info: null,
    isGive: false,
  ),
];
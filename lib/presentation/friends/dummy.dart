import 'package:relog/domain/event.dart';
import 'package:relog/domain/friends/friend.dart';
import 'package:relog/domain/friends/friend_detail.dart';
import 'package:relog/domain/friends/present.dart';

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
    birthday: '9월 22일',
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
    birthday: '1월 15일',
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
    birthday: 'null',
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
    birthday: '4월 14일',
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
    birthday: '6월 13일',
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
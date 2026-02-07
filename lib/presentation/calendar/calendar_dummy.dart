import 'package:relog/domain/calendar.dart';
import 'package:relog/domain/event/model/event.dart';
import 'package:relog/domain/event/model/event_detail.dart';

final Map<String, List<Calendar>> calendarDummy = {
  '2026-01-09': [
    Calendar(id: 101, friendId: 1, friendName: '햄스터', title: '전공 동아리 회식', category: 'event', score: 1),
    Calendar(id: 102, friendId: 1, friendName: '햄스터', title: '술약속', category: 'event', score: 2),
    Calendar(id: 108, friendId: 4, friendName: '여우', title: '생일', category: 'birthday', score: 0, info: '2025. 9. 22. 주꾸미님이 생일선물을 받았어요'),
  ],
  '2026-01-12': [
    Calendar(id: 103, friendId: 5, friendName: '강아지', title: '홍대 약속', category: 'event', score: 5),
  ],
  '2026-01-25': [
    Calendar(id: 104, friendId: 5, friendName: '강아지', title: '영화 보기', category: 'event', score: 3),
    Calendar(id: 109, friendId: 6, friendName: '판다', title: '생일', category: 'birthday', score: 0,),
  ],
  '2026-02-01': [
    Calendar(id: 105, friendId: 1, friendName: '햄스터', title: '모각코', category: 'event', score: 4),
  ],
  '2026-02-03': [
    Calendar(id: 106, friendId: 5, friendName: '강아지', title: '프로젝트 회의', category: 'event', score: 4),
  ],
  '2026-02-18': [
    Calendar(id: 110, friendId: 5, friendName: '강아지', title: '생일', category: 'birthday', score: 0, info: '2026. 1. 12. 주꾸미님이 선물을 줬어요'),
  ],
};

final List<EventDetail> dummyEventDetails = [
  EventDetail(id: 101, title: '전공 동아리 회식', eventDate: '2026-01-09', reviewScore: 1, reviewText: '술도 못 마시면서 술 강요하고 재미없는 말만 한다... 심지어 지각함', friendId: 1, friendName: '햄스터'),
  EventDetail(id: 102, title: '전공 동아리 회식', eventDate: '2026-01-09', reviewScore: 1, friendId: 1, friendName: '햄스터'),
  EventDetail(id: 103, title: '전공 동아리 회식', eventDate: '2026-01-12', reviewScore: 1, friendId: 5, friendName: '강아지'),
  EventDetail(id: 104, title: '전공 동아리 회식', eventDate: '2026-01-25', reviewScore: 1, friendId: 5, friendName: '강아지'),
  EventDetail(id: 105, title: '전공 동아리 회식', eventDate: '2026-02-01', reviewScore: 1, friendId: 6, friendName: '판다'),
  EventDetail(id: 106, title: '전공 동아리 회식', eventDate: '2026-02-03', reviewScore: 1, reviewText: '술도 못 마시면서 술 강요하고 재미없는 말만 한다... 심지어 지각함', friendId: 5, friendName: '강아지'),
  EventDetail(id: 108, title: '전공 동아리 회식', eventDate: '2026-01-09', reviewScore: 1, friendId: 5, friendName: '강아지'),
  EventDetail(id: 109, title: '전공 동아리 회식', eventDate: '2026-01-25', reviewScore: 1, friendId: 6, friendName: '판다'),
  EventDetail(id: 110, title: '전공 동아리 회식', eventDate: '2026-02-18', reviewScore: 1, reviewText: '술도 못 마시면서 술 강요하고 재미없는 말만 한다... 심지어 지각함', friendId: 5, friendName: '강아지'),
];
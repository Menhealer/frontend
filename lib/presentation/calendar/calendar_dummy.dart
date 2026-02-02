import 'package:relog/domain/calendar.dart';
import 'package:relog/domain/event.dart';

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

final List<Event> dummyEventDetails = [
  Event(id: 101, date: DateTime(2026, 1, 9), title: '전공 동아리 회식', name: '햄스터', score: 1, info: '술도 못 마시면서 술 강요하고 재미없는 말만 한다... 심지어 지각함'),
  Event(id: 102, date: DateTime(2026, 1, 9), title: '술약속', name: '햄스터', score: 2),
  Event(id: 103, date: DateTime(2026, 1, 12), title: '홍대 약속', name: '강아지', score: 5,),
  Event(id: 104, date: DateTime(2026, 1, 25), title: '영화 보기', name: '강아지', score: 3),
  Event(id: 105, date: DateTime(2026, 2, 1), title: '모각코', name: '햄스터', score: 4, info: '같이 간 카페가 매우 취향이었음'),
  Event(id: 106, date: DateTime(2026, 2, 3), title: '프로젝트 회의', name: '강아지', score: 4, info: '대화가 잘 통함'),
  Event(id: 108, date: DateTime(2026, 1, 9), title: '생일', name: '여우', score: 0),
  Event(id: 109, date: DateTime(2026, 1, 25), title: '생일', name: '판다', score: 0),
  Event(id: 110, date: DateTime(2026, 2, 18), title: '생일', name: '강아지', score: 0),
];
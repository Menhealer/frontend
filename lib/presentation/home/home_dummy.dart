import 'package:relog/domain/home/model/friendship.dart';

final Map<String, dynamic> homeDummyData = {
  // 'monthlySummary': null,
  // 'monthlySolution': null,
  // 'relationshipSolution1': null,
  // 'relationshipSolution2': null,
  // 'friendRecommendations': null,

  'monthlySummary': '이번 달에 주꾸미님은 햄스터님과 3회의 만남을 가졌어요. 평균 리뷰 점수는 2.1점으로, 전반적으로 부정적인 평가가 많았어요.\n\n기록된 내용을 보면\n- 만남 이후 감정 평가에서 피로, 답답함, 불편함이 반복적으로 등장했고,\n- 대화 만족도가 낮게 기록된 경우가 많았어요.\n- 선물 기록에서는 주꾸미님이 선물을 2회 제공했지만, 받은 기록은 없었어요.\n\n이번 달의 주꾸미님은 햄스터님과의 관계에서 정서적 소모와 불균형을 경험하고 있었어요.\n관계가 즐거움보다는 의무나 부담으로 인식되고 있으며, 기록상 긍정적인 변화는 거의 나타나지 않았어요.',
  'monthlySolution': '현재 관계는 투입 대비 만족도가 낮은 상태예요. 당분간 만남 빈도를 줄이거나, 감정적으로 거리를 두는 것이 필요해 보여요.\n\n추가적인 선물이나 일방적인 노력은 관계 개선에 큰 도움이 되지 않을 가능성이 높아요.\n\n👉 관계 상태 제안:\n단기 정리 고려 (6개월 내 재평가 권장)',

  'relationshipSolution1': '이번 분기 동안의 주꾸미님은\n사람 관계에서 기록을 남기며 스스로를 점검하려는 태도가 분명하게 나타났어요.\n\n만남 이후 감정 리뷰를 꾸준히 남긴 점에서, 관계를 무작정 이어가기보다는 나에게 어떤 영향을 주는지 인식하려는 변화가 보였어요.\n\n긍정적인 경향\n- 즐거웠던 만남에서는 리뷰 점수와 텍스트가 비교적 상세하게 기록되었어요.\n- 감정 평가에서 편안함, 웃음, 안정감 같은 표현이 반복적으로 등장했어요.\n- 관계가 잘 맞는 경우, 선물이나 이벤트보다 대화 중심의 만남을 선호하는 경향이 확인됐어요.\n\n부정적인 경향\n- 만족도가 낮은 만남 이후에는 피로감이나 불편함이 자주 기록되었어요.\n- 일부 관계에서는 주꾸미님의 노력과 감정 소비가 일방적으로 증가하는 패턴이 보였어요.\n- 감정이 소모되는 관계에서도 일정 기간 관성적으로 만남을 유지한 흔적이 나타났어요.',
  'relationshipSolution2': '이번 분기의 기록을 종합했을 때,\n주꾸미님에게 중요한 것은 만남의 횟수보다 만남 이후의 감정 상태로 보여요.\n- 앞으로는 “얼마나 자주 만났는지”보다는\n- 만난 후 내가 어떤 상태로 돌아오는지를 기준으로 관계를 유지하는 것이 좋아 보여요.\n- 관계에서 피로가 반복된다면, 잠시 거리를 두는 것도 충분히 합리적인 선택이에요.\n\n👉 분기 제안:\n감정 회복 중심 관계 관리 권장',
  'friendRecommendations': '베스트 프렌드 추천\n김낑깡님과의 만남은 이번 분기 동안 높은 만족도와 안정적인 감정 흐름을 지속적으로 보여줬어요.\n만남 이후의 기록에서 긍정적인 감정이 반복되었고, 주꾸미님이 있는 그대로 편안함을 느낄 수 있었던 관계로 판단돼요.\n\n워스트 프렌드 추천\n햄스터님과의 관계에서는 이번 분기 동안 부정적인 감정과 피로도가 누적되는 패턴이 확인됐어요.\n노력 대비 만족도가 낮았고, 관계가 휴식이 아닌 소모로 기록된 경우가 많았어요.',

  'bestPersonName': '김낑깡',
  'worstPersonName': '햄스터',
};

final bestDummy = [
  Friendship(
    id: 1,
    name: '햄스터',
    group: '동아리',
    birthday: DateTime(2024, 10, 12),
    info: '지금의 관계 흐름을 유지해요',
  ),
  Friendship(
    id: 2,
    name: '고양이',
    group: null,
    birthday: DateTime(2024, 1, 15),
    info: '만남 빈도를 조금 늘려봐요',
  ),
];


final worstDummy = [
  Friendship(
    id: 3,
    name: '토끼',
    group: null,
    birthday: null,
    info: '6개월 이내로 정리가 필요해요',
  ),
  Friendship(
    id: 4,
    name: '여우',
    group: null,
    birthday: null,
    info: '2개월 이내로 정리가 필요해요',
  ),
  Friendship(
    id: 5,
    name: '강아지',
    group: null,
    birthday: null,
    info: '1~2개월 동안 거리를 둬봐요',
  ),
  Friendship(
    id: 6,
    name: '판다',
    group: null,
    birthday: null,
    info: '노력 강도를 낮춰봐요',
  ),
  Friendship(
    id: 7,
    name: '수달',
    group: '동아리',
    birthday: null,
    info: '노력 강도를 낮춰봐요',
  ),
];

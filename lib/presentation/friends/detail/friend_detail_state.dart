import 'package:relog/domain/event/model/event.dart';
import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/domain/friends/model/friend_detail.dart';
import 'package:relog/domain/gifts/gift.dart';

class FriendDetailState {
  final bool isLoading;
  final String? errorMessage;
  final FriendDetail? friendDetail;

  FriendDetailState({
    required this.isLoading,
    this.errorMessage,
    this.friendDetail,
  });

  FriendDetailState copyWith({
    bool? isLoading,
    String? errorMessage,
    FriendDetail? friendDetail,
  }) {
    return FriendDetailState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      friendDetail: friendDetail ?? this.friendDetail,
    );
  }
  bool get hasData => friendDetail != null;

  Friend? get friend => friendDetail?.friend;

  String? get groupOrNull {
    final g = friend?.group;
    if (g == null) return null;
    final t = g.trim();
    return t.isEmpty ? null : t;
  }

  String? get birthdayOrNull {
    final b = friend?.birthday;
    if (b == null) return null;
    final t = b.trim();
    return t.isEmpty ? null : t;
  }

  int get rawScore => friend?.score ?? 0;
  int get clampedScore => rawScore.clamp(-100, 100);
  bool get isScoreEmpty => rawScore == 0;

  bool get isPositive => clampedScore >= 0;
  String get scorePercentText => '${clampedScore.abs()}% ';
  String get sentimentText => isPositive ? '긍정적' : '부정적';

  List<Event> get recent3Events {
    final list = friendDetail?.recentEvents ?? const [];
    return list.take(3).toList();
  }

  List<Gift> get recent3Gifts {
    final list = friendDetail?.giftHistory ?? const [];
    return list.take(3).toList();
  }
}
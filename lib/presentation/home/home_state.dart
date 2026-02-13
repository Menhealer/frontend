import 'package:relog/core/utils/text_join.dart';
import 'package:relog/domain/home/model/monthly.dart';
import 'package:relog/domain/home/model/quarterly.dart';

class HomeState {
  final bool isLoading;
  final String? errorMessage;
  final Monthly? monthly;
  final Quarterly? quarterly;

  HomeState({
    required this.isLoading,
    this.errorMessage,
    this.monthly,
    this.quarterly,
  });

  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    Monthly? monthly,
    Quarterly? quarterly,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      monthly: monthly ?? this.monthly,
      quarterly: quarterly ?? this.quarterly,
    );
  }

  String get monthlyAnalysisText => (monthly?.analysis ?? '').trim();

  String get monthlySuggestionsText =>
      joinLines(monthly?.suggestions ?? const <String?>[]);

  bool get hasMonthlySection =>
      monthlyAnalysisText.isNotEmpty && monthlySuggestionsText.isNotEmpty;

  String get quarterlyOverallAnalysisText {
    final top = (quarterly?.solution?.overallAnalysis ?? '').trim();
    if (top.isNotEmpty) return top;

    return (quarterly?.solution?.overallAnalysis ?? '').trim();
  }

  String get quarterlySolutionText {
    final qs = quarterly?.solution;
    return joinSections([
      qs?.positiveInsights ?? const <String?>[],
      qs?.negativeInsights ?? const <String?>[],
      qs?.actionItems ?? const <String?>[],
    ]);
  }

  String get bestFriendName =>
      (quarterly?.bestFriends.isNotEmpty == true)
          ? (quarterly!.bestFriends.first?.friend.name ?? '')
          : '';

  String get worstFriendName =>
      (quarterly?.worstFriends.isNotEmpty == true)
          ? (quarterly!.worstFriends.first?.friend.name ?? '')
          : '';

  bool get hasQuarterlySection {
    final q = quarterly;
    final qs = q?.solution;
    if (q == null || qs == null) return false;

    final hasBest = q.bestFriends.isNotEmpty;
    final hasWorst = q.worstFriends.isNotEmpty;
    final hasOverall = quarterlyOverallAnalysisText.isNotEmpty;

    final hasPositive = joinLines(qs.positiveInsights).isNotEmpty;
    final hasNegative = joinLines(qs.negativeInsights).isNotEmpty;
    final hasActions = joinLines(qs.actionItems).isNotEmpty;

    return hasBest && hasWorst && hasOverall && hasPositive && hasNegative && hasActions;
  }
}
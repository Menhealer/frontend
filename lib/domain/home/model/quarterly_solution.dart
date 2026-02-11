import 'package:freezed_annotation/freezed_annotation.dart';

part 'quarterly_solution.freezed.dart';
part 'quarterly_solution.g.dart';

@freezed
abstract class QuarterlySolution with _$QuarterlySolution {
  const factory QuarterlySolution({
    String? overallAnalysis,
    required List<String?> positiveInsights,
    required List<String?> negativeInsights,
    required List<String?> actionItems,
  }) = _QuarterlySolution;

  factory QuarterlySolution.fromJson(Map<String, dynamic> json) =>
      _$QuarterlySolutionFromJson(json);
}
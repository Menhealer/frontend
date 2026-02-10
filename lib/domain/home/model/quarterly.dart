import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relog/domain/home/model/friend_info.dart';
import 'package:relog/domain/home/model/quarterly_solution.dart';

part 'quarterly.freezed.dart';
part 'quarterly.g.dart';

@freezed
abstract class Quarterly with _$Quarterly {
  const factory Quarterly({
    required List<FriendInfo?> bestFriends,
    required List<FriendInfo?> worstFriends,
    String? overallAnalysis,
    QuarterlySolution? solution,
  }) = _Quarterly;

  factory Quarterly.fromJson(Map<String, dynamic> json) =>
      _$QuarterlyFromJson(json);
}
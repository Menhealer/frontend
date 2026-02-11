import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly.freezed.dart';
part 'monthly.g.dart';

@freezed
abstract class Monthly with _$Monthly {
  const factory Monthly({
    String? analysis,
    required List<String?> suggestions,
  }) = _Monthly;

  factory Monthly.fromJson(Map<String, dynamic> json) =>
      _$MonthlyFromJson(json);
}
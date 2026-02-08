import 'package:relog/domain/gifts/model/gift_detail.dart';

class GiftsState {
  final bool isLoading;
  final String? errorMessage;
  final List<GiftDetail> gifts;

  GiftsState({
    required this.isLoading,
    this.errorMessage,
    this.gifts = const [],
  });

  GiftsState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<GiftDetail>? gifts,
  }) {
    return GiftsState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      gifts: gifts ?? this.gifts,
    );
  }
}
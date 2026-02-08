import 'package:relog/domain/gifts/model/gift_detail.dart';

class GiftsState {
  final bool isLoading;
  final String? errorMessage;
  final List<GiftDetail> gifts;
  final bool hasChanged;
  final int? friendId;

  GiftsState({
    required this.isLoading,
    this.errorMessage,
    this.gifts = const [],
    this.hasChanged = false,
    this.friendId,
  });

  GiftsState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<GiftDetail>? gifts,
    bool? hasChanged,
    int? friendId,
  }) {
    return GiftsState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      gifts: gifts ?? this.gifts,
      hasChanged: hasChanged ?? this.hasChanged,
      friendId: friendId ?? this.friendId,
    );
  }
}
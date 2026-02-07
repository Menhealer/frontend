import 'package:relog/domain/friends/model/friend.dart';

class FriendsState {
  final bool isLoading;
  final String? errorMessage;
  final List<Friend>? friends;

  FriendsState({
    required this.isLoading,
    this.errorMessage,
    this.friends,
  });

  FriendsState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<Friend>? friends,
  }) {
    return FriendsState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      friends: friends ?? this.friends,
    );
  }
}
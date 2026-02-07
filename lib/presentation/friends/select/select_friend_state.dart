import 'package:relog/domain/friends/model/friend.dart';

class SelectFriendState {
  final bool isLoading;
  final String? errorMessage;
  final List<Friend> friends;

  SelectFriendState({
    required this.isLoading,
    this.errorMessage,
    this.friends = const [],
  });

  SelectFriendState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<Friend>? friends,
  }) {
    return SelectFriendState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      friends: friends ?? this.friends,
    );
  }
}
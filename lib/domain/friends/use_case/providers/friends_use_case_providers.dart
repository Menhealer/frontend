import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/data/friends/providers/friends_repository_provider.dart';
import 'package:relog/domain/friends/use_case/friend_edit_use_case.dart';
import 'package:relog/domain/friends/use_case/friend_name_check_use_case.dart';
import 'package:relog/domain/friends/use_case/get_friends_use_case.dart';
import 'package:relog/domain/friends/use_case/friend_write_use_case.dart';

final getFriendsUseCaseProvider = Provider<GetFriendsUseCase>((ref) {
  final repo = ref.watch(friendsRepositoryProvider);
  return GetFriendsUseCase(repo);
});

final friendWriteUseCaseProvider = Provider<FriendWriteUseCase>((ref) {
  final repo = ref.watch(friendsRepositoryProvider);
  return FriendWriteUseCase(repo);
});

final friendNameCheckUseCaseProvider = Provider<FriendNameCheckUseCase>((ref) {
  final repo = ref.watch(friendsRepositoryProvider);
  return FriendNameCheckUseCase(repo);
});

final friendEditUseCaseProvider = Provider<FriendEditUseCase>((ref) {
  final repo = ref.watch(friendsRepositoryProvider);
  return FriendEditUseCase(repo);
});
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/data/friends/providers/friends_repository_provider.dart';
import 'package:relog/domain/friends/use_case/get_friends_use_case.dart';

final getFriendsUseCaseProvider = Provider<GetFriendsUseCase>((ref) {
  final repo = ref.watch(friendsRepositoryProvider);
  return GetFriendsUseCase(repo);
});
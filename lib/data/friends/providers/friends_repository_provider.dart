import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/network/providers/dio_provider.dart';
import 'package:relog/data/friends/repository/friends_repository_impl.dart';
import 'package:relog/domain/friends/repository/friends_repository.dart';

final friendsRepositoryProvider = Provider<FriendsRepository>((ref) {
  final authDio = ref.watch(authDioProvider);

  return FriendsRepositoryImpl(authDio);
});
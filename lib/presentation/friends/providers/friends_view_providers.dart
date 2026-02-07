import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/presentation/friends/friends_state.dart';
import 'package:relog/presentation/friends/friends_view_model.dart';

final friendsViewModelProvider = NotifierProvider<FriendsViewModel, FriendsState>(
  FriendsViewModel.new,
);
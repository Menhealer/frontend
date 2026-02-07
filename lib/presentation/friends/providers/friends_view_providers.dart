import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/presentation/friends/detail/friend_detail_state.dart';
import 'package:relog/presentation/friends/detail/friend_detail_view_model.dart';
import 'package:relog/presentation/friends/friends_state.dart';
import 'package:relog/presentation/friends/friends_view_model.dart';
import 'package:relog/presentation/friends/selete/select_friend_state.dart';
import 'package:relog/presentation/friends/selete/select_friend_view_model.dart';
import 'package:relog/presentation/friends/write/friend_write_state.dart';
import 'package:relog/presentation/friends/write/friend_write_view_model.dart';

final friendsViewModelProvider = NotifierProvider<FriendsViewModel, FriendsState>(
  FriendsViewModel.new,
);

final friendDetailViewModelProvider = NotifierProvider.autoDispose<FriendDetailViewModel, FriendDetailState>(
  FriendDetailViewModel.new,
);

final friendWriteViewModelProvider = NotifierProvider.autoDispose<FriendWriteViewModel, FriendWriteState>(
  FriendWriteViewModel.new,
);

final selectFriendViewModelProvider = NotifierProvider.autoDispose<SelectFriendViewModel, SelectFriendState>(
  SelectFriendViewModel.new,
);
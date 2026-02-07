import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/domain/friends/use_case/get_friends_use_case.dart';
import 'package:relog/domain/friends/use_case/providers/friends_use_case_providers.dart';
import 'package:relog/presentation/friends/friends_state.dart';

class FriendsViewModel extends Notifier<FriendsState> {
  late final GetFriendsUseCase _getFriendsUseCase;

  @override
  FriendsState build() {
    _getFriendsUseCase = ref.read(getFriendsUseCaseProvider);
    return FriendsState(isLoading: false);
  }
  Future<void> loadFriends() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final friends = await _getFriendsUseCase.execute();

      state = state.copyWith(isLoading: false, friends: friends);
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "친구 목록을 불러오는 중\n알 수 없는 오류가 발생했습니다.",
      );
    }
  }
}
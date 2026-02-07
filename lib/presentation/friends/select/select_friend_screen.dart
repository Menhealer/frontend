import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/presentation/widgets/inputs/search_text_field.dart';
import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/presentation/friends/providers/friends_view_providers.dart';
import 'package:relog/presentation/friends/widgets/friend_card.dart';

class SelectFriendScreen extends HookConsumerWidget {

  const SelectFriendScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectFriendViewModelProvider);
    final vm = ref.read(selectFriendViewModelProvider.notifier);

    final searchController = useTextEditingController();
    useListenable(searchController);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        vm.loadFriends();
      });
      return null;
    }, const []);

    final searchQuery = searchController.text.trim();
    final List<Friend> filteredFriends = searchQuery.isEmpty
        ? state.friends
        : state.friends.where((friend) {
      return friend.name.contains(searchQuery);
    }).toList();

    // 오류
    useEffect(() {
      if (state.errorMessage != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showCupertinoDialog(
            context: context,
            barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
            builder: (_) => CustomDialog(
              title: '친구 선택',
              content: state.errorMessage!,
              actions: [
                CustomDialogAction(
                  text: '확인',
                  style: DialogActionStyle.normal,
                  onPressed: () {},
                ),
              ],
            ),
          );
        });
      }
      return null;
    }, [state.errorMessage]);

    // 로딩 상태 표시
    if (state.isLoading) {
      return Scaffold(
        backgroundColor: ColorStyles.black22,
        body: SafeArea(
          child: Center(
            child: CircularProgressIndicator(color: ColorStyles.grayD3,),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      appBar: DefaultAppBar(
        title: '친구 선택',
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.translucent,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Column(
              children: [
                // 검색
                SearchTextField(
                  controller: searchController,
                ),

                // 카드 리스트
                Expanded(
                  child: ListView.builder(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: EdgeInsets.only(top: 16),
                    itemCount: filteredFriends.length,
                    itemBuilder: (context, index) {
                      final friend = filteredFriends[index];
                      return Column(
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => context.pop({'id': friend.id, 'name': friend.name}),
                            child: FriendCard(friend: friend, showScore: false,),
                          ),

                          if (index != filteredFriends.length - 1)
                            Divider(height: 1, color: ColorStyles.black42,),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
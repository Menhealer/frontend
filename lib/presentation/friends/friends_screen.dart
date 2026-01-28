import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/ui/color_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/inputs/search_text_field.dart';
import 'package:relog/domain/friends/friend.dart';
import 'package:relog/presentation/friends/widgets/friend_card.dart';

class FriendsScreen extends HookConsumerWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    useListenable(searchController);

    final searchQuery = searchController.text.trim();

    final List<Friend> allFriends = [
      Friend(id: 1, name: '햄스터', score: 85),
      Friend(id: 2, name: '고양이', score: 42),
      Friend(id: 3, name: '토끼', score: -10),
      Friend(id: 4, name: '여우', score: 67),
      Friend(id: 5, name: '강아지', score: 95),
      Friend(id: 6, name: '판다', score: 12),
      Friend(id: 7, name: '수달', score: -45),
      Friend(id: 8, name: '늑대', score: -80),
      Friend(id: 9, name: '너구리', score: 5),
      Friend(id: 10, name: '고슴도치', score: 30),
    ];
    final List<Friend> filteredFriends = searchQuery.isEmpty
      ? allFriends
      : allFriends.where((friend) {
          return friend.name.contains(searchQuery);
        }).toList();

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      appBar: DefaultAppBar(
        title: '친구',
        showBackButton: false,
        trailing: IconButton(
          onPressed: () {
            // TODO: 친구 등록 페이지 이동
          },
          icon: Icon(
            Icons.add,
            color: ColorStyles.grayD3,
            size: 24,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
          visualDensity: VisualDensity.compact,
          highlightColor: Colors.transparent,
        ),
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
                  onTap: () {
                    // TODO: 검색 포커스 처리
                  },
                  onChanged: (value) {
                    // TODO: 친구 검색
                  },
                  onSearchTap: () {
                    // TODO: 친구 검색 버튼 클릭
                  },
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
                            onTap: () async {
                              // TODO: 친구 삭제 시 refresh
                              // final isDeleted = await onTapChatDetail(friend.id);
                              // if (isDeleted) await viewModel.loadFriends();
                            },
                            child: FriendCard(friend: friend),
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
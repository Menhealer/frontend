import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/inputs/search_text_field.dart';
import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/presentation/friends/providers/friends_view_providers.dart';
import 'package:relog/presentation/friends/widgets/friend_card.dart';

class FriendsScreen extends HookConsumerWidget {
  final void Function(int id) onTapDetail;
  final void Function(bool isEdit) onTapWrite;

  const FriendsScreen({
    super.key,
    required this.onTapDetail,
    required this.onTapWrite,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(friendsViewModelProvider);
    final vm = ref.read(friendsViewModelProvider.notifier);

    useEffect(() {
      Future.microtask(() async {
        await vm.loadFriends();
      });
      return null;
    }, []);

    final searchController = useTextEditingController();
    useListenable(searchController);

    final searchQuery = searchController.text.trim();

    final List<Friend>? filteredFriends = searchQuery.isEmpty
      ? state.friends
      : state.friends?.where((friend) {
          return friend.name.contains(searchQuery);
        }).toList();

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      appBar: DefaultAppBar(
        title: '친구',
        showBackButton: false,
        trailing: IconButton(
          onPressed: () => onTapWrite(false),
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
                SearchTextField(controller: searchController,),

                Expanded(
                  child: state.friends == null || state.friends!.isEmpty
                  ? Center(
                      child: Text(
                        '등록된 친구가 없어요',
                        style: TextStyles.normalTextBold.copyWith(
                          color: ColorStyles.grayD3,
                        ),
                      ),
                    )
                  : ListView.builder(
                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: EdgeInsets.only(top: 16),
                      itemCount: filteredFriends!.length,
                      itemBuilder: (context, index) {
                        final friend = filteredFriends[index];
                        return Column(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                onTapDetail(friend.id);

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
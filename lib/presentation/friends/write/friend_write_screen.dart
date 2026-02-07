import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/buttons/app_bar_done_button.dart';
import 'package:relog/core/presentation/widgets/buttons/picker_field.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/presentation/widgets/inputs/custom_text_field.dart';
import 'package:relog/core/presentation/widgets/picker/date_picker.dart';
import 'package:relog/domain/friends/model/friend_edit.dart';
import 'package:relog/presentation/friends/providers/friends_view_providers.dart';

class FriendWriteScreen extends HookConsumerWidget {
  final bool isEdit;
  final FriendEdit? friendInfo;

  const FriendWriteScreen({
    super.key,
    required this.isEdit,
    this.friendInfo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(friendWriteViewModelProvider);
    final vm = ref.read(friendWriteViewModelProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        vm.initialize(isEdit: isEdit, friend: friendInfo);
      });
      return null;
    }, [isEdit, friendInfo]);

    final nameController = useTextEditingController(
      text: isEdit ? friendInfo!.name : null,
    );
    useListenable(nameController);

    final groupController = useTextEditingController(
      text: isEdit ? friendInfo!.group : null,
    );
    useListenable(groupController);

    // 오류
    useEffect(() {
      if (state.errorMessage != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showCupertinoDialog(
            context: context,
            barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
            builder: (_) => CustomDialog(
              title: '친구 등록 오류',
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
        title: isEdit ? '친구 수정' : '친구 등록',
        defaultBackButtonIcon: false,
        trailing: AppBarDoneButton(
          enabled: state.canSubmit,
          onTap: () async {
            if (state.isLoading) return;
            final ok = await vm.submit();
            if (ok && context.mounted) context.pop(true);
          },
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 이름
                _FieldLabel('이름 *'),
                const SizedBox(height: 16,),
                CustomTextField(
                  controller: nameController,
                  hintText: '최대 10글자 입력 가능해요',
                  maxLength: 10,
                  onChanged: vm.onNameChanged,
                ),
                const SizedBox(height: 24,),

                // 단체
                _FieldLabel('단체'),
                const SizedBox(height: 16,),
                CustomTextField(
                  controller: groupController,
                  hintText: '단체를 입력해 주세요',
                  onChanged: vm.onGroupChanged,
                ),
                const SizedBox(height: 24,),

                // 생일
                _FieldLabel('생일'),
                const SizedBox(height: 16,),
                PickerField(
                  placeholder: '생일을 선택해 주세요',
                  valueText: !state.birthdayEnabled
                      ? '생일을 선택해 주세요'
                      : '${state.year}년 ${state.month}월 ${state.day}일',
                  onTap: () async {
                    final result = await showYmdPicker(
                      context,
                      initialYear: state.year,
                      initialMonth: state.month,
                      initialDay: state.day,
                    );
                    if (result != null) {
                      vm.onBirthdayPicked(
                        year: result.year,
                        month: result.month,
                        day: result.day,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.normalTextBold.copyWith(color: ColorStyles.white),
    );
  }
}
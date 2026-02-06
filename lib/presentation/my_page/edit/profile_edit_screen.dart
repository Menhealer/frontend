import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/action_sheet/custom_action_sheet.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/buttons/app_bar_done_button.dart';
import 'package:relog/core/presentation/widgets/buttons/picker_field.dart';
import 'package:relog/core/presentation/widgets/dialog/custom_dialog.dart';
import 'package:relog/core/presentation/widgets/inputs/custom_text_field.dart';
import 'package:relog/core/presentation/widgets/picker/date_picker.dart';
import 'package:relog/core/storage/providers/user_session_provider.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/auth/model/user_edit_request.dart';
import 'package:relog/presentation/my_page/providers/my_page_view_providers.dart';
import 'package:relog/presentation/my_page/widgets/profile_image_picker.dart';

class ProfileEditScreen extends HookConsumerWidget {
  const ProfileEditScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileEditViewModelProvider);
    final vm = ref.read(profileEditViewModelProvider.notifier);

    // 사용자 정보
    final user = ref.watch(userSessionProvider);
    final nickname = user.value!.nickname;
    final birthday = user.value!.birthday;
    final profileImage = user.value!.profileImage;

    final initialDate = useMemoized(() {
      final parsed = DateTime.tryParse(birthday);
      return parsed ?? DateTime.now();
    }, [birthday]);

    final initialYear = initialDate.year;
    final initialMonth = initialDate.month;
    final initialDay = initialDate.day;
    final year = useState<int>(initialYear);
    final month = useState<int>(initialMonth);
    final day = useState<int>(initialDay);

    final nicknameController = useTextEditingController(text: nickname);
    useListenable(nicknameController);

    final picker = useMemoized(() => ImagePicker());
    final selectedImage = useState<XFile?>(null);
    final imageRemoved = useState(false);

    // 생일 선택 picker call back
    final openPicker = useCallback(() async {
      final result = await showYmdPicker(
        context,
        initialYear: year.value,
        initialMonth: month.value,
        initialDay: day.value,
      );
      if (result == null) return;
      year.value = result.year;
      month.value = result.month;
      day.value = result.day;
    }, [context, year.value, month.value, day.value]);

    // 사진 선택 call back
    final pickImageFromGallery = useCallback(() async {
      final image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image == null) return;
      selectedImage.value = image;
      imageRemoved.value = false;
    }, [picker]);

    // 수정 버튼 활성화 조건
    final trimmedNickname = nicknameController.text.trim();
    final isNicknameChanged = trimmedNickname != nickname;
    final isNicknameValid = trimmedNickname.isNotEmpty;

    final isDirty = selectedImage.value != null ||
        imageRemoved.value ||
        isNicknameChanged ||
        year.value != initialYear ||
        month.value != initialMonth ||
        day.value != initialDay;

    final isDoneEnabled = isDirty && isNicknameValid;

    final birthdayStr = formatIntBirthday(year.value, month.value, day.value);
    final isBirthdayChanged = birthdayStr != birthday;

    // 오류
    useEffect(() {
      if (state.errorMessage != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showCupertinoDialog(
            context: context,
            barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
            builder: (_) => CustomDialog(
              title: '프로필 수정 오류',
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
        title: '프로필 수정',
        defaultBackButtonIcon: false,
        trailing: AppBarDoneButton(
          enabled: isDoneEnabled,
          onTap: () async {
            if (!isDoneEnabled || state.isLoading) return;

            final req = UserEditRequest(
              nickname: isNicknameChanged ? trimmedNickname : null,
              birthday: isBirthdayChanged ? birthdayStr : null,
            );
            final ok = await vm.profileEdit(
              request: req,
              newImage: selectedImage.value != null
                  ? File(selectedImage.value!.path)
                  : null,
              deleteImage: imageRemoved.value,
            );

            if (ok && context.mounted) context.pop();
          },
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                // 프로필 사진
                ProfileImagePicker(
                  imageUrl: imageRemoved.value ? null : profileImage,
                  imageFile: selectedImage.value != null
                    ? File(selectedImage.value!.path)
                    : null,
                  onTap: () async {
                    CustomActionSheet.show(
                      context,
                      actions: [
                        ActionSheetItem(
                          label: '프로필 이미지 변경',
                          onTap: pickImageFromGallery,
                        ),
                        ActionSheetItem(
                          label: '프로필 이미지 삭제',
                          type: ActionSheetItemType.destructive,
                          onTap: () {
                            showCupertinoDialog(
                              context: context,
                              barrierDismissible: true, // 바깥 터치 시 다이얼로그 닫힘
                              builder: (_) => CustomDialog(
                                title: '프로필 이미지 삭제',
                                content: '프로필 이미지를 삭제할까요?',
                                actions: [
                                  CustomDialogAction(
                                    text: '취소',
                                    style: DialogActionStyle.normal,
                                    onPressed: () {},
                                  ),
                                  CustomDialogAction(
                                    text: '삭제',
                                    style: DialogActionStyle.destructive,
                                    isDefaultAction: true,
                                    onPressed: () {
                                      selectedImage.value = null;
                                      imageRemoved.value = true;
                                    },
                                  ),
                                ],
                              ),
                            );
                            // 삭제 로직
                          },
                        ),
                      ],
                    );
                  },
                  imageAsset: 'assets/images/profile.png',
                ),
                const SizedBox(height: 0,),

                // 닉네임
                _FieldLabel('닉네임 *'),
                CustomTextField(
                  controller: nicknameController,
                  hintText: '최대 8글자 입력 가능해요',
                  maxLength: 8,
                ),
                const SizedBox(height: 0,),

                // 생일
                _FieldLabel('생일 *'),
                PickerField(
                  placeholder: '생일을 선택해 주세요',
                  valueText: '${year.value}년 ${month.value}월 ${day.value}일',
                  onTap: openPicker,
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
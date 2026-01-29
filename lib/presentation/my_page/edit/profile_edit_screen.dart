import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:relog/core/presentation/styles/color_styles.dart';
import 'package:relog/core/presentation/styles/text_styles.dart';
import 'package:relog/core/presentation/widgets/app_bar/default_app_bar.dart';
import 'package:relog/core/presentation/widgets/buttons/app_bar_done_button.dart';
import 'package:relog/core/presentation/widgets/buttons/picker_field.dart';
import 'package:relog/core/presentation/widgets/inputs/custom_text_field.dart';
import 'package:relog/core/presentation/widgets/picker/birthday_picker.dart';
import 'package:relog/presentation/my_page/widgets/profile_image_picker.dart';

class ProfileEditScreen extends HookConsumerWidget {
  const ProfileEditScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 사용자 정보
    const nickname = '주꾸미';
    const initialMonth = 9;
    const initialDay = 22;
    const profileImageUrl = 'https://scontent-ssn1-1.xx.fbcdn.net/v/t1.6435-9/133721829_236352984570712_2775420490512317159_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=127cfc&_nc_ohc=kmHHLh4qWycQ7kNvwEVhibE&_nc_oc=AdmOSC9pfei4M_-4DiJ-qFnkMvzAHEyy-FcQqOSPlblxHdbDA0QYmQT75bYegZmHpS0&_nc_zt=23&_nc_ht=scontent-ssn1-1.xx&_nc_gid=UO1_8jgR9aiLJUrsckRHZw&oh=00_Afp7ymLbibAEZF2DOTdL-f8b-lPqSnvFK9LUSdf8xo9Lbg&oe=699FD6F7';

    final nicknameController = useTextEditingController(text: nickname);
    useListenable(nicknameController);

    final month = useState<int>(initialMonth);
    final day = useState<int>(initialDay);

    final picker = useMemoized(() => ImagePicker());
    final selectedImage = useState<XFile?>(null);

    // 생일 선택 picker call back
    final openPicker = useCallback(() async {
      final result = await showBirthdayPicker(
        context,
        initialMonth: month.value,
        initialDay: day.value,
      );
      if (result == null) return;
      month.value = result.month;
      day.value = result.day;
    }, [context, month.value, day.value]);

    // 사진 선택 call back
    final pickImageFromGallery = useCallback(() async {
      final image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image == null) return;
      selectedImage.value = image;
    }, [picker]);

    // 수정 버튼 활성화 조건
    final trimmedNickname = nicknameController.text.trim();
    final isNicknameChanged = trimmedNickname != nickname;
    final isNicknameValid = trimmedNickname.isNotEmpty;

    final isDirty = selectedImage.value != null ||
      isNicknameChanged ||
      month.value != initialMonth ||
      day.value != initialDay;

    final isDoneEnabled = isDirty && isNicknameValid;

    return Scaffold(
      backgroundColor: ColorStyles.black22,
      appBar: DefaultAppBar(
        title: '프로필 수정',
        defaultBackButtonIcon: false,
        trailing: AppBarDoneButton(
          enabled: isDoneEnabled,
          onTap: () {
            // TODO: 프로필 수정 API
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
                  imageUrl: profileImageUrl,
                  imageFile: selectedImage.value != null
                    ? File(selectedImage.value!.path)
                    : null,
                  onTap: pickImageFromGallery,
                  imageAsset: 'assets/images/profile.png',
                ),
                const SizedBox(height: 0,),

                // 닉네임
                _FieldLabel('닉네임 *'),
                CustomTextField(
                  controller: nicknameController,
                  hintText: '닉네임을 입력해 주세요',
                  onChanged: (value) {
                    // TODO: 닉네임 유효성 검사
                  },
                ),
                const SizedBox(height: 0,),

                // 생일
                _FieldLabel('생일 *'),
                PickerField(
                  placeholder: '생일을 선택해 주세요',
                  valueText: '${month.value}월 ${day.value}일',
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
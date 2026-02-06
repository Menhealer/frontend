import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/storage/providers/user_session_provider.dart';
import 'package:relog/domain/auth/model/user_edit_request.dart';
import 'package:relog/domain/auth/use_case/profile_edit_use_case.dart';
import 'package:relog/domain/auth/use_case/providers/auth_use_case_providers.dart';
import 'package:relog/presentation/my_page/edit/profile_edit_state.dart';

class ProfileEditViewModel extends Notifier<ProfileEditState> {
  late final ProfileEditUseCase _profileEditUseCase;

  @override
  ProfileEditState build() {
    _profileEditUseCase = ref.read(profileEditUseCaseProvider);
    return ProfileEditState(isLoading: false);
  }

  Future<bool> profileEdit({
    required UserEditRequest request,
    File? newImage,
    required bool deleteImage,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final updatedUser = await _profileEditUseCase.execute(
        request: request,
        newImage: newImage,
        deleteImage: deleteImage,
      );
      await ref.read(userSessionProvider.notifier).updateUser(updatedUser);

      state = state.copyWith(isLoading: false);
      return true;
    } on ApiException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
      return false;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString().contains('10MB')
            ? '이미지 용량이 너무 커요.\n10MB 이하의 사진을 선택해 주세요.'
            : '프로필 수정 중 알 수 없는\n오류가 발생했습니다.',
      );
      return false;
    }
  }
}
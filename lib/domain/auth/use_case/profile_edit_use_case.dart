import 'dart:io';
import 'package:relog/core/utils/image_resize_util.dart';
import 'package:relog/domain/auth/model/user.dart';
import 'package:relog/domain/auth/model/user_edit_request.dart';
import 'package:relog/domain/auth/repository/auth_repository.dart';

class ProfileEditUseCase {
  final AuthRepository _authRepository;
  ProfileEditUseCase(this._authRepository);

  Future<User> execute({
    required UserEditRequest request,
    File? newImage,
    required bool deleteImage,
  }) async {
    var req = request;

    if (newImage != null) {
      final uploadFile = await ImageResizeUtil.compressIfNeeded(newImage);

      final url = await _authRepository.profileImageUpload(uploadFile);
      req = req.copyWith(profileImage: url);
    } else if (deleteImage) {
      await _authRepository.profileImageDelete();
    }

    return await _authRepository.profileEdit(req);
  }
}
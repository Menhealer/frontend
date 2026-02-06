import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/exception/social_exception.dart';
import 'package:relog/core/utils/map_without_null.dart';
import 'package:relog/domain/auth/model/login_request.dart';
import 'package:relog/domain/auth/model/login_response.dart';
import 'package:relog/domain/auth/model/sign_up_request.dart';
import 'package:relog/domain/auth/model/user.dart';
import 'package:relog/domain/auth/model/user_edit_request.dart';
import 'package:relog/domain/auth/repository/auth_repository.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _plainDio;
  final Dio _authDio;

  AuthRepositoryImpl(
    this._plainDio,
    this._authDio,
  );

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final endpoint = dotenv.get('LOGIN_ENDPOINT');

    try {
      final response = await _plainDio.post(endpoint, data: request.toJson());
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '로그인에 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  @override
  Future<LoginResponse> signUp(SignUpRequest request) async {
    final endpoint = dotenv.get('SIGNUP_ENDPOINT');

    try {
      final response = await _plainDio.post(endpoint, data: request.toJson());
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '회원가입에 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  @override
  Future<String?> kakaoLogin() async {
    if (await kakao.isKakaoTalkInstalled()) {
      try {
        final token = await kakao.UserApi.instance.loginWithKakaoTalk();
        return token.accessToken;
      } catch (error) {
        if (isCanceledPlatformException(error)) return null;

        if (isKakaoRateLimitError(error)) {
          throw const KakaoRateLimitException();
        }

        // 카카오톡 실패 시 카카오계정으로 fallback
        try {
          final token = await kakao.UserApi.instance.loginWithKakaoAccount();
          return token.accessToken;
        } catch (error) {
          if (isCanceledPlatformException(error)) return null;

          if (isKakaoRateLimitError(error)) {
            throw const KakaoRateLimitException();
          }

          throw SocialException();
        }
      }
    } else {
      try {
        final token = await kakao.UserApi.instance.loginWithKakaoAccount();
        return token.accessToken;
      } catch (error) {
        if (isCanceledPlatformException(error)) return null;

        if (isKakaoRateLimitError(error)) {
          throw const KakaoRateLimitException();
        }
        throw SocialException();
      }
    }
  }

  @override
  Future<String?> appleLogin() {
    // TODO: implement appleLogin
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    final endpoint = dotenv.get('LOGOUT_ENDPOINT');

    try {
      await _authDio.post(endpoint);
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '로그아웃에 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  @override
  Future<String> profileImageUpload(File file) async {
    final endpoint = dotenv.get('PROFILE_IMAGE_UPLOAD_ENDPOINT');
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.uri.pathSegments.last,
      ),
    });

    try {
      final response = await _authDio.post(
        endpoint,
        data: formData,
      );

      final data = response.data;
      return data['profileImageUrl'].toString();
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '프로필 이미지 변경에 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  @override
  Future<void> profileImageDelete() async {
    final endpoint = dotenv.get('PROFILE_IMAGE_DELETE_ENDPOINT');
    try {
      await _authDio.delete(endpoint);
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '프로필 이미지 삭제에 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  @override
  Future<User> profileEdit(UserEditRequest request) async {
    final endpoint = dotenv.get('PROFILE_EDIT_ENDPOINT');
    try {
      final response = await _authDio.put(
        endpoint,
        data: request.toJson().withoutNulls(),
      );

      return User.fromJson(response.data);
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '프로필 수정에 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  // @override
  // Future<String?> appleLogin() async {
  //   try {
  //     final credential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );
  //
  //     final token = credential.identityToken;
  //     if (token == null || token.isEmpty) return null;
  //
  //     return token;
  //   } on SignInWithAppleAuthorizationException catch (e) {
  //     if (e.code == AuthorizationErrorCode.canceled) return null;
  //     final msg = (e.message).toLowerCase();
  //     final looksLikeCancel =
  //       msg.contains('cancel') ||
  //       msg.contains('canceled') ||
  //       msg.contains('user cancelled') ||
  //       msg.contains('user canceled');
  //     if (looksLikeCancel) return null;
  //
  //     throw SocialException();
  //   } catch (e) {
  //     final msg = e.toString().toLowerCase();
  //     final looksLikeCancel =
  //       msg.contains('cancel') ||
  //       msg.contains('canceled') ||
  //       msg.contains('user cancelled') ||
  //       msg.contains('user canceled');
  //
  //     if (looksLikeCancel) return null;
  //
  //     throw SocialException();
  //   }
  // }
}
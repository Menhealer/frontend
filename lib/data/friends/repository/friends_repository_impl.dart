import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/network/http_status_code.dart';
import 'package:relog/core/utils/map_without_null.dart';
import 'package:relog/domain/friends/model/friend.dart';
import 'package:relog/domain/friends/model/friend_detail.dart';
import 'package:relog/domain/friends/model/friend_edit_request.dart';
import 'package:relog/domain/friends/model/friend_write_request.dart';
import 'package:relog/domain/friends/repository/friends_repository.dart';

class FriendsRepositoryImpl implements FriendsRepository {
  final Dio _authDio;

  FriendsRepositoryImpl(this._authDio,);

  @override
  Future<List<Friend>> getFriends() async {
    final endpoint = dotenv.get('FRIENDS_ENDPOINT');

    try {
      final response = await _authDio.get(endpoint);
      final data = response.data as List<dynamic>;

      return data.map((e) =>
          Friend.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '친구 목록을 불러오는 데 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  @override
  Future<Friend?> friendWrite(FriendWriteRequest request) async {
    final endpoint = dotenv.get('FRIENDS_ENDPOINT');

    try {
      final response = await _authDio.post(
        endpoint,
        data: request.toJson().withoutNulls(),
      );
      if (response.statusCode == HttpStatusCode.created.code) return Friend.fromJson(response.data);
      return null;
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '친구 등록에 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  @override
  Future<Friend?> friendEdit(FriendEditRequest request, int friendId) async {
    final baseEndpoint = dotenv.get('FRIENDS_ENDPOINT');
    final endpoint = '$baseEndpoint/$friendId';

    try {
      final response = await _authDio.put(
        endpoint,
        data: request.toJson().withoutNulls(),
      );

      if (response.statusCode == HttpStatusCode.ok.code) return Friend.fromJson(response.data);
      return null;
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '정보 수정에 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  @override
  Future<bool> checkName(String name) async {
    final endpoint = dotenv.get('FRIEND_NAME_CHECK_ENDPOINT');
    final requestBody = {
      "name": name,
    };

    try {
      final response = await _authDio.post(
        endpoint,
        data: requestBody,
      );
      return response.data['duplicate'] as bool;
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '중복 확인에 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  @override
  Future<FriendDetail> getFriendDetail(int friendId) async {
    final baseEndpoint = dotenv.get('FRIENDS_ENDPOINT');
    final endpoint = '$baseEndpoint/$friendId';

    try {
      final response = await _authDio.get(endpoint);

      return FriendDetail.fromJson(response.data);
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '친구 정보를 불러오는 데 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  @override
  Future<bool> friendDelete(int friendId) async {
    final baseEndpoint = dotenv.get('FRIENDS_ENDPOINT');
    final endpoint = '$baseEndpoint/$friendId';

    try {
      final response = await _authDio.delete(endpoint);
      if (response.statusCode == HttpStatusCode.ok.code) return true;
      return false;
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '친구 정보를 삭제하는 데 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }
}
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/domain/gifts/model/gift_detail.dart';
import 'package:relog/domain/gifts/repository/gifts_repository.dart';

class GiftsRepositoryImpl implements GiftsRepository {
  final Dio _authDio;

  GiftsRepositoryImpl(this._authDio,);

  @override
  Future<List<GiftDetail>> getGifts() async {
    final endpoint = dotenv.get('GIFTS_ENDPOINT');

    try {
      final response = await _authDio.get(endpoint);
      final data = response.data as List<dynamic>;

      return data.map((e) =>
          GiftDetail.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '선물 목록을 불러오는 데 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }
}
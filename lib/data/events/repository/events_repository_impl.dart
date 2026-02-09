import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/network/http_status_code.dart';
import 'package:relog/domain/events/model/calendar.dart';
import 'package:relog/domain/events/repository/events_repository.dart';

class EventsRepositoryImpl implements EventsRepository {
  final Dio _authDio;

  EventsRepositoryImpl(this._authDio,);

  @override
  Future<Calendar> getCalendar(int year, int month) async {
    final endpoint = dotenv.get('EVENTS_CALENDAR_ENDPOINT');

    try {
      final response = await _authDio.get(
        endpoint,
        queryParameters: {
          'year': year,
          'month': month,
        },
      );
      if (response.statusCode == HttpStatusCode.ok.code) return Calendar.fromJson(response.data);
      throw ApiException(
        '일정 목록을 불러오는 데 실패했어요',
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '일정 목록을 불러오는 데 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }
}
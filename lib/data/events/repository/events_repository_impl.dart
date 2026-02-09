import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/network/http_status_code.dart';
import 'package:relog/core/utils/map_without_null.dart';
import 'package:relog/domain/events/model/calendar.dart';
import 'package:relog/domain/events/model/event_detail.dart';
import 'package:relog/domain/events/model/event_edit_request.dart';
import 'package:relog/domain/events/model/event_write_request.dart';
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

  @override
  Future<EventDetail> getEvent(int eventId) async {
    final baseEndpoint = dotenv.get('EVENTS_ENDPOINT');
    final endpoint = '$baseEndpoint/$eventId';

    try {
      final response = await _authDio.get(endpoint);
      if (response.statusCode == HttpStatusCode.ok.code) return EventDetail.fromJson(response.data);
      throw ApiException(
        '일정 상세 정보를 불러오는 데 실패했어요',
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '일정 상세 정보를 불러오는 데 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  @override
  Future<EventDetail> eventWrite(EventWriteRequest request) async {
    final endpoint = dotenv.get('EVENTS_ENDPOINT');

    try {
      final response = await _authDio.post(
        endpoint,
        data: request.toJson().withoutNulls(),
      );
      if (response.statusCode == HttpStatusCode.created.code) return EventDetail.fromJson(response.data);
      throw ApiException(
        '일정 등록에 실패했어요',
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '일정 등록에 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  @override
  Future<EventDetail> eventEdit(EventEditRequest request, int eventId) async {
    final baseEndpoint = dotenv.get('EVENTS_ENDPOINT');
    final endpoint = '$baseEndpoint/$eventId';

    try {
      print('event edit: ${request.toJson().withoutNulls()}');
      final response = await _authDio.put(
        endpoint,
        data: request.toJson().withoutNulls(),
      );

      if (response.statusCode == HttpStatusCode.ok.code) return EventDetail.fromJson(response.data);
      throw ApiException(
        '정보 수정에 실패했어요',
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '정보 수정에 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      print('error: $e');
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }
}
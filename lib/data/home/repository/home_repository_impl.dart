import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:relog/core/exception/api_exception.dart';
import 'package:relog/core/storage/shared_preferences_service.dart';
import 'package:relog/core/utils/text_join.dart';
import 'package:relog/core/utils/time_format.dart';
import 'package:relog/domain/home/model/monthly.dart';
import 'package:relog/domain/home/model/quarterly.dart';
import 'package:relog/domain/home/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final Dio _authDio;
  final SharedPreferencesService _prefs;

  HomeRepositoryImpl(this._authDio, this._prefs);

  @override
  Future<Monthly?> getMonthly(int year, int month) async {
    final endpoint = dotenv.get('SETTLEMENTS_MONTHLY_ENDPOINT');

    try {
      final ver = monthlyVersion(year, month);

      // cache
      final cached = await _prefs.getMonthlyIfFresh(
        year: year,
        month: month,
        expectedVersion: ver,
      );
      if (cached != null) return cached;

      final response = await _authDio.get(
        endpoint,
        queryParameters: {
          'year': year,
          'month': month,
        },
      );
      final data = Monthly.fromJson(response.data['solution']);

      if (shouldCacheMonthly(data)) {
        await _prefs.saveMonthly(year: year, month: month, version: ver, value: data);
      }

      return data;
    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '월별 분석 내용을 불러오는 데 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  @override
  Future<Quarterly> getQuarterly(int year, int quarter) async {
    final endpoint = dotenv.get('SETTLEMENTS_QUARTERLY_ENDPOINT');

    try {
      final ver = quarterlyVersion(year, quarter);

      final cached = await _prefs.getQuarterlyIfFresh(
        year: year,
        quarter: quarter,
        expectedVersion: ver,
      );
      if (cached != null) {
        return cached;
      }

      final response = await _authDio.get(
        endpoint,
        queryParameters: {
          'year': year,
          'quarter': quarter,
        },
      );
      final data = Quarterly.fromJson(response.data);

      if (shouldCacheQuarterly(data)) {
        await _prefs.saveQuarterly(year: year, quarter: quarter, version: ver, value: data);
      }

      return data;

    } on DioException catch (e) {
      if (e.error is ApiException) {
        throw e.error!;
      }
      throw ApiException(
        '분기별 분석 내용을 불러오는 데 실패했어요',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw ApiException('알 수 없는 오류가 발생했어요');
    }
  }

  bool shouldCacheMonthly(Monthly m) {
    final analysisText = (m.analysis ?? '').trim();
    final suggestionsText = joinLines(m.suggestions);
    return analysisText.isNotEmpty && suggestionsText.isNotEmpty;
  }

  bool shouldCacheQuarterly(Quarterly q) {
    final qs = q.solution;
    if (qs == null) return false;

    final hasBest = q.bestFriends.isNotEmpty;
    final hasWorst = q.worstFriends.isNotEmpty;

    final overallTop = (q.solution?.overallAnalysis ?? '').trim();
    final overallInSolution = (qs.overallAnalysis ?? '').trim();
    final hasOverall = overallTop.isNotEmpty || overallInSolution.isNotEmpty;

    final hasPositive = joinLines(qs.positiveInsights).isNotEmpty;
    final hasNegative = joinLines(qs.negativeInsights).isNotEmpty;
    final hasActions = joinLines(qs.actionItems).isNotEmpty;

    return hasBest && hasWorst && hasOverall && hasPositive && hasNegative && hasActions;
  }
}
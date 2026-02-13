import 'dart:convert';
import 'package:relog/domain/home/model/monthly.dart';
import 'package:relog/domain/home/model/quarterly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:relog/domain/auth/model/user.dart';

class SharedPreferencesService {
  static const _idKey = 'id';
  static const _nicknameKey = 'nickname';
  static const _birthdayKey = 'birthday';
  static const _profileImageKey = 'profile_image';
  static const _loginPlatformKey = 'provider';
  static const _marketingConsentKey = 'marketing_consent';

  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt(_idKey, user.id);
    await prefs.setString(_nicknameKey, user.nickname);
    await prefs.setString(_birthdayKey, user.birthday);
    await prefs.setString(_profileImageKey, user.profileImage ?? '');
    await prefs.setString(_loginPlatformKey, user.provider);
  }

  Future<User?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final id = prefs.getInt(_idKey);
    final nickname = prefs.getString(_nicknameKey);
    final birthday = prefs.getString(_birthdayKey);
    final profileImage = prefs.getString(_profileImageKey);
    final loginPlatform = prefs.getString(_loginPlatformKey);

    if (id == null || nickname == null || birthday == null || loginPlatform == null) return null;

    return User(
      id: id,
      nickname: nickname,
      birthday: birthday,
      profileImage: (profileImage == null || profileImage.isEmpty) ? null : profileImage,
      provider: loginPlatform,
    );
  }

  Future<void> clearUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_idKey);
    await prefs.remove(_nicknameKey);
    await prefs.remove(_birthdayKey);
    await prefs.remove(_profileImageKey);
    await prefs.remove(_loginPlatformKey);
  }

  Future<void> saveMarketingConsent(bool agreed) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_marketingConsentKey, agreed);
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<bool> getMarketingConsent() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_marketingConsentKey) ?? false;
  }

  // Home analysis cache
  static const _homeMonthlyPrefix = 'home_monthly';
  static const _homeQuarterlyPrefix = 'home_quarterly';

  bool _isHomeMonthlyKey(String key) => key.startsWith(_homeMonthlyPrefix);
  bool _isHomeQuarterlyKey(String key) => key.startsWith(_homeQuarterlyPrefix);

  Future<void> pruneHomeMonthlyCache({required int keepYear, required int keepMonth}) async {
    final prefs = await SharedPreferences.getInstance();
    final keepDataKey = _monthlyDataKey(keepYear, keepMonth);
    final keepVerKey = _monthlyVersionKey(keepYear, keepMonth);

    final keys = prefs.getKeys();
    for (final k in keys) {
      if (!_isHomeMonthlyKey(k)) continue;
      if (k == keepDataKey || k == keepVerKey) continue;
      await prefs.remove(k);
    }
  }

  Future<void> pruneHomeQuarterlyCache({required int keepYear, required int keepQuarter}) async {
    final prefs = await SharedPreferences.getInstance();
    final keepDataKey = _quarterlyDataKey(keepYear, keepQuarter);
    final keepVerKey = _quarterlyVersionKey(keepYear, keepQuarter);

    final keys = prefs.getKeys();
    for (final k in keys) {
      if (!_isHomeQuarterlyKey(k)) continue;
      if (k == keepDataKey || k == keepVerKey) continue;
      await prefs.remove(k);
    }
  }

  String _ymKey(int year, int month) => '$year-${month.toString().padLeft(2, '0')}';

  String _quarterKey(int year, int quarter) => '$year-Q$quarter';

  String _monthlyDataKey(int year, int month) => '${_homeMonthlyPrefix}_${_ymKey(year, month)}';
  String _monthlyVersionKey(int year, int month) => '${_monthlyDataKey(year, month)}_version';

  String _quarterlyDataKey(int year, int quarter) => '${_homeQuarterlyPrefix}_${_quarterKey(year, quarter)}';
  String _quarterlyVersionKey(int year, int quarter) => '${_quarterlyDataKey(year, quarter)}_version';

  Future<String?> getMonthlyJsonIfFresh({
    required int year,
    required int month,
    required String expectedVersion,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getString(_monthlyVersionKey(year, month));
    if (v != expectedVersion) return null;
    return prefs.getString(_monthlyDataKey(year, month));
  }

  Future<void> saveMonthlyJson({
    required int year,
    required int month,
    required String version,
    required String json,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_monthlyDataKey(year, month), json);
    await prefs.setString(_monthlyVersionKey(year, month), version);
  }

  Future<void> clearMonthlyCache({required int year, required int month}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_monthlyDataKey(year, month));
    await prefs.remove(_monthlyVersionKey(year, month));
  }

  Future<String?> getQuarterlyJsonIfFresh({
    required int year,
    required int quarter,
    required String expectedVersion,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getString(_quarterlyVersionKey(year, quarter));
    if (v != expectedVersion) return null;
    return prefs.getString(_quarterlyDataKey(year, quarter));
  }

  Future<void> saveQuarterlyJson({
    required int year,
    required int quarter,
    required String version,
    required String json,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_quarterlyDataKey(year, quarter), json);
    await prefs.setString(_quarterlyVersionKey(year, quarter), version);
  }

  Future<void> clearQuarterlyCache({required int year, required int quarter}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_quarterlyDataKey(year, quarter));
    await prefs.remove(_quarterlyVersionKey(year, quarter));
  }

  Future<Monthly?> getMonthlyIfFresh({
    required int year,
    required int month,
    required String expectedVersion,
  }) async {
    final jsonStr = await getMonthlyJsonIfFresh(
      year: year,
      month: month,
      expectedVersion: expectedVersion,
    );
    if (jsonStr == null || jsonStr.trim().isEmpty) return null;

    try {
      final map = jsonDecode(jsonStr) as Map<String, dynamic>;
      return Monthly.fromJson(map);
    } catch (_) {
      // corrupted cache
      await clearMonthlyCache(year: year, month: month);
      return null;
    }
  }

  Future<void> saveMonthly({
    required int year,
    required int month,
    required String version,
    required Monthly value,
    bool pruneOld = true,
  }) async {
    final jsonStr = jsonEncode(value.toJson());
    await saveMonthlyJson(year: year, month: month, version: version, json: jsonStr);

    if (pruneOld) {
      await pruneHomeMonthlyCache(keepYear: year, keepMonth: month);
    }
  }

  Future<Quarterly?> getQuarterlyIfFresh({
    required int year,
    required int quarter,
    required String expectedVersion,
  }) async {
    final jsonStr = await getQuarterlyJsonIfFresh(
      year: year,
      quarter: quarter,
      expectedVersion: expectedVersion,
    );
    if (jsonStr == null || jsonStr.trim().isEmpty) return null;

    try {
      final map = jsonDecode(jsonStr) as Map<String, dynamic>;
      return Quarterly.fromJson(map);
    } catch (_) {
      await clearQuarterlyCache(year: year, quarter: quarter);
      return null;
    }
  }

  Future<void> saveQuarterly({
    required int year,
    required int quarter,
    required String version,
    required Quarterly value,
    bool pruneOld = true,
  }) async {
    final jsonStr = jsonEncode(value.toJson());
    await saveQuarterlyJson(year: year, quarter: quarter, version: version, json: jsonStr);

    if (pruneOld) {
      await pruneHomeQuarterlyCache(keepYear: year, keepQuarter: quarter);
    }
  }
}
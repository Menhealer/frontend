import 'package:shared_preferences/shared_preferences.dart';
import 'package:relog/domain/auth/model/user.dart';

class SharedPreferencesService {
  static const _idKey = 'id';
  static const _nicknameKey = 'nickname';
  static const _birthdayKey = 'birthday';
  static const _profileImageKey = 'profileImage';
  static const _loginPlatformKey = 'provider';

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
}
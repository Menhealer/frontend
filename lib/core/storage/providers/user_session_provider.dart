import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/storage/providers/secure_storage_provider.dart';
import 'package:relog/core/storage/providers/shared_preferences_provider.dart';
import 'package:relog/core/storage/secure_storage_service.dart';
import 'package:relog/core/storage/shared_preferences_service.dart';
import 'package:relog/domain/auth/model/user.dart';

final userSessionProvider = AsyncNotifierProvider<UserSessionNotifier, User?>(UserSessionNotifier.new);

class UserSessionNotifier extends AsyncNotifier<User?> {
  late final SharedPreferencesService _sharedPreferencesService;
  late final SecureStorageService _secureStorageService;

  @override
  Future<User?> build() async {
    _sharedPreferencesService = ref.read(sharedPreferencesProvider);
    _secureStorageService = ref.read(secureStorageProvider);

    final user = await _sharedPreferencesService.getUser();
    return user;
  }

  bool get isSignedIn => state.asData?.value != null;

  Future<void> setUser(User user, String accessToken, String refreshToken) async {
    await _sharedPreferencesService.saveUser(user);
    await _secureStorageService.write('accessToken', accessToken);
    await _secureStorageService.write('refreshToken', refreshToken);
    state = AsyncValue.data(user);
  }

  Future<void> updateUser(User user) async {
    await _sharedPreferencesService.saveUser(user);
    state = AsyncValue.data(user);
  }

  Future<void> clear() async {
    await _sharedPreferencesService.clearUser();
    await _secureStorageService.delete();
    state = const AsyncValue.data(null);
  }
}
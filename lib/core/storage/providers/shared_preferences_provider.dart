import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relog/core/storage/shared_preferences_service.dart';

final sharedPreferencesProvider = Provider<SharedPreferencesService>((ref) {
  return SharedPreferencesService();
});
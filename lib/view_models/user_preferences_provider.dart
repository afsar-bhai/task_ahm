import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_preferences.dart';
import '../services/hive_service.dart';

final userPreferencesProvider = StateNotifierProvider<UserPreferencesNotifier, UserPreferences>((ref) {
  return UserPreferencesNotifier();
});

class UserPreferencesNotifier extends StateNotifier<UserPreferences> {
  UserPreferencesNotifier() : super(UserPreferences());

  final HiveService _hiveService = HiveService();

  Future<void> loadPreferences() async {
    state = _hiveService.getPreferences();
  }

  Future<void> toggleTheme() async {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
    await _hiveService.savePreferences(state);
  }

  Future<void> setSortOrder(String sortOrder) async {
    state = state.copyWith(sortOrder: sortOrder);
    await _hiveService.savePreferences(state);
  }
}
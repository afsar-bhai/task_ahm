import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
 import '../models/user_preferences.dart';
 // import '../models/user_preferences.g.dart'; // Import the generated file

class HiveService {
  static const String _preferencesBox = 'preferencesBox';

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserPreferencesAdapter()); // Register the generated adapter
    await Hive.openBox<UserPreferences>(_preferencesBox);
  }

  Box<UserPreferences> get preferencesBox => Hive.box<UserPreferences>(_preferencesBox);

  UserPreferences getPreferences() {
    return preferencesBox.get('preferences') ?? UserPreferences();
  }

  Future<void> savePreferences(UserPreferences preferences) async {
    await preferencesBox.put('preferences', preferences);
  }
}
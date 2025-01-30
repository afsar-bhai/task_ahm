import 'package:hive/hive.dart';

part 'user_preferences.g.dart'; // Add this line

@HiveType(typeId: 0) // Unique typeId for Hive
class UserPreferences {
  @HiveField(0) // Unique fieldId for Hive
  bool isDarkMode;

  @HiveField(1) // Unique fieldId for Hive
  String sortOrder;

  UserPreferences({
    this.isDarkMode = false,
    this.sortOrder = 'date',
  });

  // Add the copyWith method
  UserPreferences copyWith({
    bool? isDarkMode,
    String? sortOrder,
  }) {
    return UserPreferences(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
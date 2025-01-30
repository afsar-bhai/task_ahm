import 'package:ahamdabad_task/services/hive_service.dart';
import 'package:ahamdabad_task/view_models/user_preferences_provider.dart';
import 'package:ahamdabad_task/views/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  runApp(ProviderScope(child: MyApp()));
}
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(userPreferencesProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: preferences.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(),
    );
  }
}
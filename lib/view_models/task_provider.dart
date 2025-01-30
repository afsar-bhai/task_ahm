import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/task_model.dart';
import '../services/sqlite_service.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  final SQLiteService _sqliteService = SQLiteService();

  Future<void> loadTasks() async {
    state = await _sqliteService.getTasks(); // Load tasks from the database
  }

  Future<void> addTask(Task task) async {
    await _sqliteService.insertTask(task); // Save task to the database
    await loadTasks(); // Reload tasks after adding
  }

  Future<void> updateTask(Task task) async {
    await _sqliteService.updateTask(task); // Update task in the database
    await loadTasks(); // Reload tasks after updating
  }

  Future<void> deleteTask(int id) async {
    await _sqliteService.deleteTask(id); // Delete task from the database
    await loadTasks(); // Reload tasks after deleting
  }
}
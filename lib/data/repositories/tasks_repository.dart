import '../../bloc/tasks/tasks_models.dart';

/// Repository interface managing Tasks.
abstract class TasksRepository {
  /// Fetches the list of all tasks.
  Future<List<Task>> getTasks();

  /// Toggles completion status of a task by ID.
  Future<List<Task>> toggleTaskCompletion(String id);
}

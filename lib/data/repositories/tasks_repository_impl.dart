import '../../bloc/tasks/tasks_models.dart';
import 'mock_tasks_data.dart';
import 'tasks_repository.dart';

/// Concrete implementation of [TasksRepository] with mock data.
class TasksRepositoryImpl implements TasksRepository {
  late final List<Task> _mockTasks = createMockTasks();

  @override
  Future<List<Task>> getTasks() async {
    return List.unmodifiable(_mockTasks);
  }

  @override
  Future<List<Task>> toggleTaskCompletion(String id) async {
    final idx = _mockTasks.indexWhere((t) => t.id == id);
    if (idx != -1) {
      final t = _mockTasks[idx];
      _mockTasks[idx] = t.copyWith(isCompleted: !t.isCompleted);
    }
    return List.unmodifiable(_mockTasks);
  }

  @override
  Future<Task> addTask(Task task) async {
    final taskWithId = task.copyWith(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
    );
    _mockTasks.insert(0, taskWithId);
    return taskWithId;
  }
}

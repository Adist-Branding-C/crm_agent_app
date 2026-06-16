import '../../bloc/tasks/tasks_models.dart';
import 'tasks_repository.dart';

/// Concrete implementation of [TasksRepository] with mock data.
class TasksRepositoryImpl implements TasksRepository {
  final List<Task> _mockTasks = [
    const Task(
      id: '1', title: 'Prepare project proposal', type: TaskType.task,
      time: 'Today, 5:30 PM', isCompleted: false, isOverdue: false,
      priority: TaskPriority.high,
    ),
    const Task(
      id: '2', title: 'Campus visit — Aravind Krishnan', type: TaskType.meeting,
      time: 'Today, 6:00 PM', isCompleted: false, isOverdue: false,
      priority: TaskPriority.medium,
    ),
    const Task(
      id: '3', title: 'Collect documents — Anjali Suresh', type: TaskType.task,
      time: 'Today, 7:00 PM', isCompleted: false, isOverdue: false,
      priority: TaskPriority.high,
    ),
    const Task(
      id: '4', title: 'Confirm batch slot — Lakshmi Warrier', type: TaskType.call,
      time: 'Today, 2:30 PM OVERDUE', isCompleted: false, isOverdue: true,
      priority: TaskPriority.high,
    ),
    const Task(
      id: '5', title: 'Demo reminder — Divya Raveendran', type: TaskType.call,
      time: 'Yesterday, 11:00 AM OVERDUE', isCompleted: false, isOverdue: true,
      priority: TaskPriority.medium,
    ),
    const Task(
      id: '6', title: 'Deal paperwork — Enterprise batch', type: TaskType.deal,
      time: 'Tomorrow, 10:00 AM', isCompleted: false, isOverdue: false,
      priority: TaskPriority.medium,
    ),
    const Task(
      id: '7', title: 'Welcome call — new admission', type: TaskType.call,
      time: 'Yesterday, 9:00 AM', isCompleted: true, isOverdue: false,
      priority: TaskPriority.low,
    ),
    const Task(
      id: '8', title: 'Quarterly review prep', type: TaskType.task,
      time: '2 days ago', isCompleted: true, isOverdue: false,
      priority: TaskPriority.low,
    ),
  ];

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

import 'tasks_bloc.dart';
import 'tasks_models.dart';

/// Presentation selectors and filters for the [TasksLoaded] state.
extension TasksSelectors on TasksLoaded {
  /// Returns tasks filtered by the selected filter.
  List<Task> get filteredTasks {
    switch (filter) {
      case TasksFilter.all:
        return allTasks;
      case TasksFilter.pending:
        return allTasks.where((t) => !t.isCompleted).toList();
      case TasksFilter.overdue:
        return allTasks.where((t) => !t.isCompleted && t.isOverdue).toList();
      case TasksFilter.completed:
        return allTasks.where((t) => t.isCompleted).toList();
    }
  }

  /// Counts of pending tasks.
  int get pendingCount => allTasks.where((t) => !t.isCompleted).length;

  /// Counts of overdue pending tasks.
  int get overdueCount =>
      allTasks.where((t) => !t.isCompleted && t.isOverdue).length;
}

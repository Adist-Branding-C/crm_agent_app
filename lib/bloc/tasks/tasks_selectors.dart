import 'tasks_bloc.dart';
import 'tasks_models.dart';
import 'tasks_date_filter.dart';

/// Pure function to filter tasks list.
List<Task> applyTasksFiltering(
  List<Task> allTasks,
  TasksFilter filter,
  TaskFilterCriteria filterCriteria,
  DateTime now,
) {
  List<Task> tasks = allTasks;

  switch (filter) {
    case TasksFilter.all:
      break;
    case TasksFilter.pending:
      tasks = tasks.where((t) => !t.isCompleted).toList();
      break;
    case TasksFilter.overdue:
      tasks = tasks.where((t) => !t.isCompleted && t.isOverdue).toList();
      break;
    case TasksFilter.completed:
      tasks = tasks.where((t) => t.isCompleted).toList();
      break;
  }

  if (filterCriteria.types.isNotEmpty) {
    tasks = tasks.where((t) => filterCriteria.types.contains(t.type)).toList();
  }

  if (filterCriteria.priorities.isNotEmpty) {
    tasks = tasks
        .where((t) => filterCriteria.priorities.contains(t.priority))
        .toList();
  }

  if (filterCriteria.dateRange != DateRangeType.none) {
    final today = DateTime(now.year, now.month, now.day);
    tasks = tasks.where((t) {
      if (t.dueDate == null) return false;
      final tDate = DateTime(
        t.dueDate!.year,
        t.dueDate!.month,
        t.dueDate!.day,
      );

      return filterCriteria.dateRange.matches(
        tDate,
        today,
        from: filterCriteria.customFrom,
        to: filterCriteria.customTo,
      );
    }).toList();
  }

  return tasks;
}

/// Presentation selectors and counts for [TasksLoaded].
extension TasksSelectors on TasksLoaded {
  /// Counts of pending tasks.
  int get pendingCount => allTasks.where((t) => !t.isCompleted).length;

  /// Counts of overdue pending tasks.
  int get overdueCount =>
      allTasks.where((t) => !t.isCompleted && t.isOverdue).length;
}

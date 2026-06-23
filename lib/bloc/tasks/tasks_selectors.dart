import 'tasks_bloc.dart';
import 'tasks_models.dart';

/// Presentation selectors and filters for the [TasksLoaded] state.
extension TasksSelectors on TasksLoaded {
  /// Returns tasks filtered by the selected filter.
  List<Task> getFilteredTasks(DateTime now) {
    List<Task> tasks = allTasks;

    switch (filter) {
      case TasksFilter.all: break;
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
      tasks = tasks.where((t) => filterCriteria.priorities.contains(t.priority)).toList();
    }

    if (filterCriteria.dateRange != DateRangeType.none) {
      final today = DateTime(now.year, now.month, now.day);
      tasks = tasks.where((t) {
        if (t.dueDate == null) return false;
        final tDate = DateTime(t.dueDate!.year, t.dueDate!.month, t.dueDate!.day);

        switch (filterCriteria.dateRange) {
          case DateRangeType.today: return tDate == today;
          case DateRangeType.tomorrow:
            return tDate == today.add(const Duration(days: 1));
          case DateRangeType.lastWeek:
            final sevenDaysAgo = today.subtract(const Duration(days: 7));
            return tDate.isAfter(sevenDaysAgo.subtract(const Duration(seconds: 1))) &&
                tDate.isBefore(today.add(const Duration(days: 1)));
          case DateRangeType.custom:
            final from = filterCriteria.customFrom;
            final to = filterCriteria.customTo;
            if (from == null || to == null) return true;
            final fDate = DateTime(from.year, from.month, from.day);
            final oDate = DateTime(to.year, to.month, to.day);
            return tDate.isAfter(fDate.subtract(const Duration(seconds: 1))) &&
                tDate.isBefore(oDate.add(const Duration(days: 1)));
          default: return true;
        }
      }).toList();
    }

    return tasks;
  }

  /// Counts of pending tasks.
  int get pendingCount => allTasks.where((t) => !t.isCompleted).length;

  /// Counts of overdue pending tasks.
  int get overdueCount =>
      allTasks.where((t) => !t.isCompleted && t.isOverdue).length;
}

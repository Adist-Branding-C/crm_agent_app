part of 'tasks_bloc.dart';

/// Available filters for the Tasks screen.
enum TasksFilter {
  all,
  pending,
  overdue,
  completed,
}

/// Base class for all Tasks states.
abstract class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object?> get props => [];
}

/// Initial state.
class TasksInitial extends TasksState {
  const TasksInitial();
}

/// Loading state.
class TasksLoading extends TasksState {
  const TasksLoading();
}

/// Loaded state containing tasks list and current filter.
class TasksLoaded extends TasksState {
  final List<Task> allTasks;
  final TasksFilter filter;

  /// Creates a constant [TasksLoaded] state.
  const TasksLoaded({
    required this.allTasks,
    this.filter = TasksFilter.all,
  });

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

  /// Copy constructor.
  TasksLoaded copyWith({
    List<Task>? allTasks,
    TasksFilter? filter,
  }) {
    return TasksLoaded(
      allTasks: allTasks ?? this.allTasks,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object?> get props => [allTasks, filter];
}

/// Error state.
class TasksError extends TasksState {
  final String errorMessage;

  /// Creates a constant [TasksError] state.
  const TasksError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

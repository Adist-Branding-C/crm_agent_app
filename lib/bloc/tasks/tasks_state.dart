import 'package:equatable/equatable.dart';
import 'tasks_filter_criteria.dart';
import 'tasks_models.dart';

/// Available filters for the Tasks screen.
enum TasksFilter {
  all('All'),
  pending('Pending'),
  overdue('Overdue'),
  completed('Completed');

  final String label;
  const TasksFilter(this.label);
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
  final TaskFilterCriteria filterCriteria;
  final TasksFailure? actionFailure;

  /// Creates a constant [TasksLoaded] state.
  const TasksLoaded({
    required this.allTasks,
    this.filter = TasksFilter.all,
    this.filterCriteria = const TaskFilterCriteria(),
    this.actionFailure,
  });

  /// Copy constructor.
  TasksLoaded copyWith({
    List<Task>? allTasks,
    TasksFilter? filter,
    TaskFilterCriteria? filterCriteria,
    TasksFailure? Function()? actionFailure,
  }) => TasksLoaded(
    allTasks: allTasks ?? this.allTasks,
    filter: filter ?? this.filter,
    filterCriteria: filterCriteria ?? this.filterCriteria,
    actionFailure: actionFailure != null ? actionFailure() : this.actionFailure,
  );

  @override
  List<Object?> get props => [allTasks, filter, filterCriteria, actionFailure];
}

enum TasksFailure { load, toggle, unknown }

/// Error state.
class TasksError extends TasksState {
  final TasksFailure failure;

  const TasksError({required this.failure});

  @override
  List<Object?> get props => [failure];
}

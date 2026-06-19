import 'package:equatable/equatable.dart';
import 'tasks_state.dart';

/// Base class for all Tasks events.
abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load all tasks.
class LoadTasks extends TasksEvent {
  const LoadTasks();
}

/// Event to toggle a task's completion status.
class ToggleTaskCompletion extends TasksEvent {
  final String taskId;

  /// Creates a constant [ToggleTaskCompletion].
  const ToggleTaskCompletion(this.taskId);

  @override
  List<Object?> get props => [taskId];
}

/// Event to change the filter criteria.
class FilterChanged extends TasksEvent {
  final TasksFilter filter;

  /// Creates a constant [FilterChanged].
  const FilterChanged(this.filter);

  @override
  List<Object?> get props => [filter];
}

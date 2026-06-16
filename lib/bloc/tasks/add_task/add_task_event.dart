part of 'add_task_bloc.dart';

/// Base event class for the [AddTaskBloc].
abstract class AddTaskEvent extends Equatable {
  const AddTaskEvent();

  @override
  List<Object?> get props => [];
}

/// Triggered when the task title text changes.
class TaskTitleChanged extends AddTaskEvent {
  final String title;
  const TaskTitleChanged(this.title);

  @override
  List<Object?> get props => [title];
}

/// Triggered when the task description text changes.
class TaskDescriptionChanged extends AddTaskEvent {
  final String description;
  const TaskDescriptionChanged(this.description);

  @override
  List<Object?> get props => [description];
}

/// Triggered when the selected task type changes.
class TaskTypeChanged extends AddTaskEvent {
  final TaskType type;
  const TaskTypeChanged(this.type);

  @override
  List<Object?> get props => [type];
}

/// Triggered when the due date changes.
class TaskDueDateChanged extends AddTaskEvent {
  final String dueDate;
  const TaskDueDateChanged(this.dueDate);

  @override
  List<Object?> get props => [dueDate];
}

/// Triggered when the selected priority changes.
class TaskPriorityChanged extends AddTaskEvent {
  final TaskPriority priority;
  const TaskPriorityChanged(this.priority);

  @override
  List<Object?> get props => [priority];
}

/// Triggered when the form is submitted.
class SubmitAddTask extends AddTaskEvent {
  const SubmitAddTask();
}

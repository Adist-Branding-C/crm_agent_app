part of 'add_task_bloc.dart';

/// Represents the state of the [AddTaskBloc] form.
class AddTaskState extends Equatable {
  final TaskTitleInput title;
  final TaskDescriptionInput description;
  final TaskType type;
  final String dueDate;
  final DateTime? dueDateTime;
  final TaskPriority priority;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;
  final Task? newTask;

  const AddTaskState({
    this.title = const TaskTitleInput.pure(),
    this.description = const TaskDescriptionInput.pure(),
    this.type = TaskType.task,
    this.dueDate = 'Today, 5:00 PM',
    this.dueDateTime,
    this.priority = TaskPriority.high,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
    this.newTask,
  });

  /// Returns true if all form fields are valid.
  bool get isValid => title.isValid && description.isValid;

  /// Returns a copy of the state with modified fields.
  AddTaskState copyWith({
    TaskTitleInput? title,
    TaskDescriptionInput? description,
    TaskType? type,
    String? dueDate,
    DateTime? dueDateTime,
    TaskPriority? priority,
    bool? isSubmitting,
    bool? isSuccess,
    String? Function()? errorMessage,
    Task? Function()? newTask,
  }) {
    return AddTaskState(
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      dueDate: dueDate ?? this.dueDate,
      dueDateTime: dueDateTime ?? this.dueDateTime,
      priority: priority ?? this.priority,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      newTask: newTask != null ? newTask() : this.newTask,
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        type,
        dueDate,
        dueDateTime,
        priority,
        isSubmitting,
        isSuccess,
        errorMessage,
        newTask,
      ];
}

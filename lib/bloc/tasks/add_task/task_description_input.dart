part of 'add_task_bloc.dart';

/// Validation errors for the [TaskDescriptionInput] input.
enum TaskDescriptionValidationError { tooLong }

/// Represents the Task Description input field.
class TaskDescriptionInput extends FormzInput<String, TaskDescriptionValidationError> {
  const TaskDescriptionInput.pure() : super.pure('');
  const TaskDescriptionInput.dirty([super.value = '']) : super.dirty();

  @override
  TaskDescriptionValidationError? validator(String value) {
    return value.length > 500 ? TaskDescriptionValidationError.tooLong : null;
  }
}

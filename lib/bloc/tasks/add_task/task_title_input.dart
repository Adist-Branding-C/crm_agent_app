import 'package:formz/formz.dart';

/// Validation errors for the [TaskTitleInput] input.
enum TaskTitleValidationError { empty }

/// Represents the Task Title input field.
class TaskTitleInput extends FormzInput<String, TaskTitleValidationError> {
  const TaskTitleInput.pure() : super.pure('');
  const TaskTitleInput.dirty([super.value = '']) : super.dirty();

  @override
  TaskTitleValidationError? validator(String value) {
    return value.trim().isEmpty ? TaskTitleValidationError.empty : null;
  }
}

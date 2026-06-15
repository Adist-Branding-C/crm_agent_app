part of 'add_lead_bloc.dart';

/// Validation errors for the [LeadEmail] input.
enum LeadEmailValidationError {
  /// Returned when the input is empty or contains only whitespace.
  empty,

  /// Returned when the input does not match a valid email format.
  invalidFormat,
}

/// Represents the Email input field in the Add Lead form.
class LeadEmail extends FormzInput<String, LeadEmailValidationError> {
  /// Constructor for a pure (unmodified) email.
  const LeadEmail.pure() : super.pure('');

  /// Constructor for a dirty (modified) email.
  const LeadEmail.dirty([super.value = '']) : super.dirty();

  @override
  LeadEmailValidationError? validator(String value) {
    if (value.trim().isEmpty) {
      return LeadEmailValidationError.empty;
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      return LeadEmailValidationError.invalidFormat;
    }
    return null;
  }
}

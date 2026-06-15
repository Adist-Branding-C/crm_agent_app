part of 'add_lead_bloc.dart';

/// Validation errors for the [LeadName] input.
enum LeadNameValidationError {
  /// Returned when the input is empty or contains only whitespace.
  empty,

  /// Returned when the length is less than 3.
  tooShort,

  /// Returned when the input contains non-alphabetic characters.
  invalidFormat,
}

/// Represents the Full Name input field in the Add Lead form.
class LeadName extends FormzInput<String, LeadNameValidationError> {
  /// Constructor for a pure (unmodified) name.
  const LeadName.pure() : super.pure('');

  /// Constructor for a dirty (modified) name.
  const LeadName.dirty([super.value = '']) : super.dirty();

  @override
  LeadNameValidationError? validator(String value) {
    if (value.trim().isEmpty) {
      return LeadNameValidationError.empty;
    }
    if (value.length < 3) {
      return LeadNameValidationError.tooShort;
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return LeadNameValidationError.invalidFormat;
    }
    return null;
  }
}

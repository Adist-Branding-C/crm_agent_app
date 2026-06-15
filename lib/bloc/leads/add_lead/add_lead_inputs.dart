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

/// Validation errors for the [LeadPhone] input.
enum LeadPhoneValidationError {
  /// Returned when the input is empty or contains only whitespace.
  empty,

  /// Returned when the input is not a 10-digit number.
  invalidFormat,
}

/// Represents the Phone input field in the Add Lead form.
class LeadPhone extends FormzInput<String, LeadPhoneValidationError> {
  /// Constructor for a pure (unmodified) phone.
  const LeadPhone.pure() : super.pure('');

  /// Constructor for a dirty (modified) phone.
  const LeadPhone.dirty([super.value = '']) : super.dirty();

  @override
  LeadPhoneValidationError? validator(String value) {
    if (value.trim().isEmpty) {
      return LeadPhoneValidationError.empty;
    }
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return LeadPhoneValidationError.invalidFormat;
    }
    return null;
  }
}

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

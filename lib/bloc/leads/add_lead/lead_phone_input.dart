import 'package:formz/formz.dart';

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

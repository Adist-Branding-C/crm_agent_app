part of 'forgot_password_bloc.dart';

/// Validation errors for the [ForgotPasswordPhone] input.
enum ForgotPasswordPhoneValidationError {
  /// Returned when the input is empty.
  empty,

  /// Returned when the format is invalid (contains non-digits).
  invalidFormat,

  /// Returned when the length of digits is less than 10.
  tooShort,
}

/// Represents the Phone Number input field in the forgot password form.
class ForgotPasswordPhone
    extends FormzInput<String, ForgotPasswordPhoneValidationError> {
  const ForgotPasswordPhone.pure() : super.pure('');
  const ForgotPasswordPhone.dirty([super.value = '']) : super.dirty();

  @override
  ForgotPasswordPhoneValidationError? validator(String value) {
    if (value.isEmpty) {
      return ForgotPasswordPhoneValidationError.empty;
    }
    final regExp = RegExp(r'^\+?[0-9]*$');
    if (!regExp.hasMatch(value)) {
      return ForgotPasswordPhoneValidationError.invalidFormat;
    }
    final digitCount = value.replaceAll(RegExp(r'[^0-9]'), '').length;
    if (digitCount < 10) {
      return ForgotPasswordPhoneValidationError.tooShort;
    }
    return null;
  }
}

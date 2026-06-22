part of 'new_password_bloc.dart';

/// Validation errors for the [NewPassword] input.
enum NewPasswordValidationError {
  /// Returned when the input is empty.
  empty,

  /// Returned when the length is less than 6 characters.
  tooShort,
}

/// Represents the New Password input field.
class NewPassword extends FormzInput<String, NewPasswordValidationError> {
  const NewPassword.pure() : super.pure('');
  const NewPassword.dirty([super.value = '']) : super.dirty();

  @override
  NewPasswordValidationError? validator(String value) {
    if (value.isEmpty) return NewPasswordValidationError.empty;
    if (value.length < 6) return NewPasswordValidationError.tooShort;
    return null;
  }
}

/// Validation errors for the [NewConfirmPassword] input.
enum NewConfirmPasswordValidationError {
  /// Returned when the input is empty.
  empty,

  /// Returned when the input does not match the password.
  mismatch,
}

/// Represents the Confirm Password input field.
class NewConfirmPassword
    extends FormzInput<String, NewConfirmPasswordValidationError> {
  final String password;

  const NewConfirmPassword.pure({this.password = ''}) : super.pure('');
  const NewConfirmPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  @override
  NewConfirmPasswordValidationError? validator(String value) {
    if (value.isEmpty) return NewConfirmPasswordValidationError.empty;
    if (value != password) return NewConfirmPasswordValidationError.mismatch;
    return null;
  }
}

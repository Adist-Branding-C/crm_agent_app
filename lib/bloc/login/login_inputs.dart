part of 'login_bloc.dart';

/// Validation errors for the [LoginPhone] input.
enum LoginPhoneValidationError {
  /// Returned when the input is empty.
  empty,

  /// Returned when the format is invalid (contains non-digits).
  invalidFormat,

  /// Returned when the length of digits is less than 10.
  tooShort,
}

/// Represents the Phone Number input field in the login form.
class LoginPhone extends FormzInput<String, LoginPhoneValidationError> {
  /// Constructor for a pure (unmodified) phone number.
  const LoginPhone.pure() : super.pure('');

  /// Constructor for a dirty (modified) phone number.
  const LoginPhone.dirty([super.value = '']) : super.dirty();

  @override
  LoginPhoneValidationError? validator(String value) {
    if (value.isEmpty) {
      return LoginPhoneValidationError.empty;
    }
    final regExp = RegExp(r'^\+?[0-9]*$');
    if (!regExp.hasMatch(value)) {
      return LoginPhoneValidationError.invalidFormat;
    }
    final digitCount = value.replaceAll(RegExp(r'[^0-9]'), '').length;
    if (digitCount < 10) {
      return LoginPhoneValidationError.tooShort;
    }
    return null;
  }
}

/// Validation errors for the [LoginPassword] input.
enum LoginPasswordValidationError {
  /// Returned when the input is empty.
  empty,

  /// Returned when the length is less than 6 characters.
  tooShort,
}

/// Authentication failure types emitted by the bloc (not UI strings).
enum AuthFailure { invalidCredentials, unknown }

/// Represents the Password input field in the login form.
class LoginPassword extends FormzInput<String, LoginPasswordValidationError> {
  /// Constructor for a pure (unmodified) password.
  const LoginPassword.pure() : super.pure('');

  /// Constructor for a dirty (modified) password.
  const LoginPassword.dirty([super.value = '']) : super.dirty();

  @override
  LoginPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return LoginPasswordValidationError.empty;
    }
    if (value.length < 6) {
      return LoginPasswordValidationError.tooShort;
    }
    return null;
  }
}

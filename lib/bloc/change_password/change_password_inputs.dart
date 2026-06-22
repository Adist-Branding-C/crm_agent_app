part of 'change_password_bloc.dart';

/// Validation errors for the [ChangeCurrentPassword] input.
enum ChangeCurrentPasswordValidationError { empty }

/// Represents the Current Password input field.
class ChangeCurrentPassword
    extends FormzInput<String, ChangeCurrentPasswordValidationError> {
  const ChangeCurrentPassword.pure() : super.pure('');
  const ChangeCurrentPassword.dirty([super.value = '']) : super.dirty();

  @override
  ChangeCurrentPasswordValidationError? validator(String value) {
    return value.isEmpty ? ChangeCurrentPasswordValidationError.empty : null;
  }
}

/// Validation errors for the [ChangeNewPassword] input.
enum ChangeNewPasswordValidationError { empty, tooShort, invalid }

/// Represents the New Password input field.
class ChangeNewPassword
    extends FormzInput<String, ChangeNewPasswordValidationError> {
  const ChangeNewPassword.pure() : super.pure('');
  const ChangeNewPassword.dirty([super.value = '']) : super.dirty();

  @override
  ChangeNewPasswordValidationError? validator(String value) {
    if (value.isEmpty) return ChangeNewPasswordValidationError.empty;
    if (value.length < 8) return ChangeNewPasswordValidationError.tooShort;
    final hasUpper = value.contains(RegExp(r'[A-Z]'));
    final hasLower = value.contains(RegExp(r'[a-z]'));
    final hasDigit = value.contains(RegExp(r'[0-9]'));
    if (!hasUpper || !hasLower || !hasDigit) {
      return ChangeNewPasswordValidationError.invalid;
    }
    return null;
  }
}

/// Validation errors for the [ChangeConfirmPassword] input.
enum ChangeConfirmPasswordValidationError { empty, mismatch }

/// Represents the Confirm Password input field.
class ChangeConfirmPassword
    extends FormzInput<String, ChangeConfirmPasswordValidationError> {
  final String newPassword;

  const ChangeConfirmPassword.pure({this.newPassword = ''}) : super.pure('');
  const ChangeConfirmPassword.dirty({required this.newPassword, String value = ''})
      : super.dirty(value);

  @override
  ChangeConfirmPasswordValidationError? validator(String value) {
    if (value.isEmpty) return ChangeConfirmPasswordValidationError.empty;
    if (value != newPassword) return ChangeConfirmPasswordValidationError.mismatch;
    return null;
  }
}

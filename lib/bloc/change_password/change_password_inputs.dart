import 'package:formz/formz.dart';

enum ChangeCurrentPasswordValidationError { empty }

class ChangeCurrentPassword
    extends FormzInput<String, ChangeCurrentPasswordValidationError> {
  const ChangeCurrentPassword.pure() : super.pure('');
  const ChangeCurrentPassword.dirty([super.value = '']) : super.dirty();

  @override
  ChangeCurrentPasswordValidationError? validator(String value) {
    return value.isEmpty ? ChangeCurrentPasswordValidationError.empty : null;
  }
}

enum ChangeNewPasswordValidationError { empty, tooShort, invalid }

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

enum ChangeConfirmPasswordValidationError { empty, mismatch }

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

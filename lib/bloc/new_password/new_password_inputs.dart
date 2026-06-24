import 'package:formz/formz.dart';

enum NewPasswordValidationError { empty, tooShort }

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

enum NewConfirmPasswordValidationError { empty, mismatch }

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

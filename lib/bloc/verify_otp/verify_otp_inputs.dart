part of 'verify_otp_bloc.dart';

/// Validation errors for the [VerifyOtpCode] input.
enum VerifyOtpCodeValidationError {
  /// Returned when the input is empty.
  empty,

  /// Returned when the format is invalid (contains non-digits).
  invalidFormat,

  /// Returned when the length of digits is less than 6.
  tooShort,
}

/// Represents the OTP code input field in the verification form.
class VerifyOtpCode
    extends FormzInput<String, VerifyOtpCodeValidationError> {
  const VerifyOtpCode.pure() : super.pure('');
  const VerifyOtpCode.dirty([super.value = '']) : super.dirty();

  @override
  VerifyOtpCodeValidationError? validator(String value) {
    if (value.isEmpty) {
      return VerifyOtpCodeValidationError.empty;
    }
    final regExp = RegExp(r'^[0-9]*$');
    if (!regExp.hasMatch(value)) {
      return VerifyOtpCodeValidationError.invalidFormat;
    }
    if (value.length < 6) {
      return VerifyOtpCodeValidationError.tooShort;
    }
    return null;
  }
}

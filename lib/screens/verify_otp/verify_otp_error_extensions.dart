import '../../bloc/verify_otp/verify_otp_bloc.dart';
import '../../bloc/verify_otp/verify_otp_failure.dart';

/// Extension to map [VerifyOtpCodeValidationError] to localized messages.
extension VerifyOtpCodeValidationErrorX on VerifyOtpCodeValidationError {
  String get message {
    switch (this) {
      case VerifyOtpCodeValidationError.empty:
        return 'OTP code is required.';
      case VerifyOtpCodeValidationError.invalidFormat:
        return 'OTP code must contain only digits.';
      case VerifyOtpCodeValidationError.tooShort:
        return 'OTP code must be 6 digits.';
    }
  }
}

/// Extension providing presentation-related getters for [VerifyOtpState].
extension VerifyOtpStatePresentation on VerifyOtpState {
  String? get codeError {
    if (code.isPure) return null;
    return code.error?.message ?? failure?.message;
  }
}

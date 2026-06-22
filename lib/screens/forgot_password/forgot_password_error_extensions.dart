import '../../bloc/forgot_password/forgot_password_bloc.dart';
import '../app_strings.dart';

/// Extension to map [ForgotPasswordPhoneValidationError] to localized messages.
extension ForgotPasswordPhoneValidationErrorX
    on ForgotPasswordPhoneValidationError {
  /// User-facing error message.
  String get message {
    switch (this) {
      case ForgotPasswordPhoneValidationError.empty:
        return AppStrings.phoneRequired;
      case ForgotPasswordPhoneValidationError.invalidFormat:
        return AppStrings.phoneDigitsOnly;
      case ForgotPasswordPhoneValidationError.tooShort:
        return AppStrings.phoneMinDigits;
    }
  }
}

/// Extension providing presentation-related getters for [ForgotPasswordState].
extension ForgotPasswordStatePresentation on ForgotPasswordState {
  /// Specific validation error text for the phone number field.
  String? get phoneError {
    if (phone.isPure) return null;
    return phone.error?.message ?? errorMessage;
  }
}

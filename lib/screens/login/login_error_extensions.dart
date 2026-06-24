import '../../bloc/login/login_bloc.dart';
import '../app_strings.dart';

/// Extension to map [LoginPhoneValidationError] to user-facing error messages.
extension LoginPhoneValidationErrorX on LoginPhoneValidationError {
  /// Localized or user-facing error message.
  String get message {
    switch (this) {
      case LoginPhoneValidationError.empty:
        return AppStrings.phoneRequired;
      case LoginPhoneValidationError.invalidFormat:
        return AppStrings.phoneDigitsOnly;
      case LoginPhoneValidationError.tooShort:
        return AppStrings.phoneMinDigits;
    }
  }
}

/// Extension to map [LoginPasswordValidationError] to user-facing error messages.
extension LoginPasswordValidationErrorX on LoginPasswordValidationError {
  /// Localized or user-facing error message.
  String get message {
    switch (this) {
      case LoginPasswordValidationError.empty:
        return AppStrings.passwordRequired;
      case LoginPasswordValidationError.tooShort:
        return AppStrings.passwordMinLength;
    }
  }
}

/// Extension providing presentation-related getters for [LoginState].
extension LoginStatePresentation on LoginState {
  /// Specific validation error text for the phone number field.
  String? get phoneError {
    if (authErrorMessage != null) return authErrorMessage;
    if (authFailure != null) return authFailure!.message;
    if (phone.isPure) return null;
    if (phone.error == LoginPhoneValidationError.empty && !isSubmitted) {
      return null;
    }
    return phone.error?.message;
  }

  /// Specific validation error text for the password field.
  String? get passwordError {
    if (password.isPure) return null;
    if (password.error == LoginPasswordValidationError.empty && !isSubmitted) {
      return null;
    }
    return password.error?.message;
  }
}

/// Extension to map [AuthFailure] to user-facing error messages.
extension AuthFailureMessage on AuthFailure {
  String get message {
    return switch (this) {
      AuthFailure.invalidCredentials => AppStrings.authFailed,
      AuthFailure.network => 'Network error. Please check your connection.',
      AuthFailure.unknown => 'An unexpected error occurred.',
    };
  }
}

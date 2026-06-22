import '../../bloc/new_password/new_password_bloc.dart';
import '../app_strings.dart';

/// Extension to map [NewPasswordValidationError] to localized messages.
extension NewPasswordValidationErrorX on NewPasswordValidationError {
  /// User-facing error message.
  String get message {
    switch (this) {
      case NewPasswordValidationError.empty:
        return AppStrings.passwordRequired;
      case NewPasswordValidationError.tooShort:
        return AppStrings.passwordMinLength;
    }
  }
}

/// Extension to map [NewConfirmPasswordValidationError] to localized messages.
extension NewConfirmPasswordValidationErrorX on NewConfirmPasswordValidationError {
  /// User-facing error message.
  String get message {
    switch (this) {
      case NewConfirmPasswordValidationError.empty:
        return 'Confirm password is required.';
      case NewConfirmPasswordValidationError.mismatch:
        return "Passwords don't match";
    }
  }
}

/// Extension providing presentation-related getters for [NewPasswordState].
extension NewPasswordStatePresentation on NewPasswordState {
  /// Specific validation error text for the password field.
  String? get passwordError {
    if (newPassword.isPure) return null;
    return newPassword.error?.message ?? errorMessage;
  }

  /// Specific validation error text for the confirm password field.
  String? get confirmPasswordError {
    if (confirmPassword.isPure) return null;
    return confirmPassword.error?.message;
  }
}

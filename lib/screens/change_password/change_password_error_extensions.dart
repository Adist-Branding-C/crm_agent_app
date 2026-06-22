import '../../bloc/change_password/change_password_bloc.dart';

/// Extension to map validation errors to localized message strings.
extension ChangePasswordStatePresentation on ChangePasswordState {
  /// Specific validation error text for the current password field.
  String? get currentPasswordError {
    if (currentPassword.isPure) return null;
    if (currentPassword.error == ChangeCurrentPasswordValidationError.empty) {
      return 'Current password is required.';
    }
    return null;
  }

  /// Specific validation error text for the new password field.
  String? get newPasswordError {
    if (newPassword.isPure) return null;
    switch (newPassword.error) {
      case ChangeNewPasswordValidationError.empty:
        return 'New password is required.';
      case ChangeNewPasswordValidationError.tooShort:
        return 'Password must be at least 8 characters.';
      case ChangeNewPasswordValidationError.invalid:
        return 'Password must include uppercase, lowercase, and numbers.';
      case null:
        return null;
    }
  }

  /// Specific validation error text for the confirm password field.
  String? get confirmPasswordError {
    if (confirmPassword.isPure) return null;
    switch (confirmPassword.error) {
      case ChangeConfirmPasswordValidationError.empty:
        return 'Confirm password is required.';
      case ChangeConfirmPasswordValidationError.mismatch:
        return "Passwords don't match";
      case null:
        return null;
    }
  }
}

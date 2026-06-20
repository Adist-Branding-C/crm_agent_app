import '../../bloc/leads/add_lead/add_lead_bloc.dart';
import '../app_strings.dart';

/// Extension to map [LeadNameValidationError] to user-facing error messages.
extension LeadNameValidationErrorX on LeadNameValidationError {
  /// Localized or user-facing error message.
  String get message {
    switch (this) {
      case LeadNameValidationError.empty:
        return AppStrings.leadNameRequired;
      case LeadNameValidationError.tooShort:
      case LeadNameValidationError.invalidFormat:
        return AppStrings.leadNameInvalid;
    }
  }
}

/// Extension to map [LeadPhoneValidationError] to user-facing error messages.
extension LeadPhoneValidationErrorX on LeadPhoneValidationError {
  /// Localized or user-facing error message.
  String get message {
    switch (this) {
      case LeadPhoneValidationError.empty:
        return AppStrings.leadPhoneRequired;
      case LeadPhoneValidationError.invalidFormat:
        return AppStrings.leadPhoneInvalid;
    }
  }
}

/// Extension to map [LeadEmailValidationError] to user-facing error messages.
extension LeadEmailValidationErrorX on LeadEmailValidationError {
  /// Localized or user-facing error message.
  String get message {
    switch (this) {
      case LeadEmailValidationError.empty:
        return AppStrings.leadEmailRequired;
      case LeadEmailValidationError.invalidFormat:
        return AppStrings.leadEmailInvalid;
    }
  }
}

/// Extension providing presentation-related getters for [AddLeadState].
extension AddLeadStatePresentation on AddLeadState {
  /// Error message for name, null if valid.
  String? get nameError {
    if (nameInput.isPure) return null;
    return nameInput.error?.message;
  }

  /// Error message for phone, null if valid.
  String? get phoneError {
    if (phoneInput.isPure) return null;
    return phoneInput.error?.message;
  }

  /// Error message for email, null if valid.
  String? get emailError {
    if (emailInput.isPure) return null;
    return emailInput.error?.message;
  }
}

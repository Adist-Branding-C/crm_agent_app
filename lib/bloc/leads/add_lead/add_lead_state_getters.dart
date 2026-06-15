part of 'add_lead_bloc.dart';

/// Extension providing validation and error message getters for [AddLeadState].
extension AddLeadStateGetters on AddLeadState {
  /// Error message for name, null if valid.
  String? get nameError {
    if (nameInput.isPure) return null;
    switch (nameInput.error) {
      case LeadNameValidationError.empty:
        return AppStrings.leadNameRequired;
      case LeadNameValidationError.tooShort:
      case LeadNameValidationError.invalidFormat:
        return AppStrings.leadNameInvalid;
      case null:
        return null;
    }
  }

  /// Error message for phone, null if valid.
  String? get phoneError {
    if (phoneInput.isPure) return null;
    switch (phoneInput.error) {
      case LeadPhoneValidationError.empty:
        return AppStrings.leadPhoneRequired;
      case LeadPhoneValidationError.invalidFormat:
        return AppStrings.leadPhoneInvalid;
      case null:
        return null;
    }
  }

  /// Error message for email, null if valid.
  String? get emailError {
    if (emailInput.isPure) return null;
    switch (emailInput.error) {
      case LeadEmailValidationError.empty:
        return AppStrings.leadEmailRequired;
      case LeadEmailValidationError.invalidFormat:
        return AppStrings.leadEmailInvalid;
      case null:
        return null;
    }
  }

  /// True if all validated fields have no errors and are not empty.
  bool get isValid => Formz.validate([nameInput, phoneInput, emailInput]);
}

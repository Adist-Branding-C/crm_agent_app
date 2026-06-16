part of 'add_lead_bloc.dart';

/// Extension providing validation and error indicators for [AddLeadState].
extension AddLeadStateGetters on AddLeadState {
  /// Whether the name input is invalid (has errors and is not pure).
  bool get isNameInvalid => !nameInput.isPure && nameInput.error != null;

  /// Whether the phone input is invalid (has errors and is not pure).
  bool get isPhoneInvalid => !phoneInput.isPure && phoneInput.error != null;

  /// Whether the email input is invalid (has errors and is not pure).
  bool get isEmailInvalid => !emailInput.isPure && emailInput.error != null;

  /// True if all validated fields have no errors and are not empty.
  bool get isValid => Formz.validate([nameInput, phoneInput, emailInput]);
}

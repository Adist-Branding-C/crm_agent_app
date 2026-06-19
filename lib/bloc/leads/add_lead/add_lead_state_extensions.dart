import 'package:formz/formz.dart';
import 'add_lead_bloc.dart';
import 'add_lead_state.dart';
import 'lead_name_input.dart';
import 'lead_phone_input.dart';
import 'lead_email_input.dart';
import '../leads_enums.dart';
import '../leads_models.dart';

/// Extension providing copy utilities for [AddLeadState].
extension AddLeadStateCopy on AddLeadState {
  AddLeadState copyWith({
    LeadName? nameInput,
    LeadPhone? phoneInput,
    LeadEmail? emailInput,
    LeadSource? source,
    LeadPurpose? purpose,
    LeadCategory? category,
    LeadStatus? status,
    String? location,
    String? Function()? nextFollowUp,
    String? Function()? note,
    bool? isSubmitting,
    bool? isSuccess,
    String? Function()? error,
    Lead? lead,
  }) {
    return AddLeadState(
      formInputs: formInputs.copyWith(
        nameInput: nameInput, phoneInput: phoneInput,
        emailInput: emailInput, source: source,
        purpose: purpose, category: category,
        status: status, location: location,
        nextFollowUp: nextFollowUp, note: note,
      ),
      submission: submission.copyWith(
        isSubmitting: isSubmitting, isSuccess: isSuccess,
        error: error, lead: lead,
      ),
    );
  }
}

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

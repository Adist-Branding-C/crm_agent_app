part of 'add_lead_bloc.dart';

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

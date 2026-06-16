part of 'add_lead_bloc.dart';

/// Extension providing copy utilities for [AddLeadState].
extension AddLeadStateCopy on AddLeadState {
  /// Creates a copy of [AddLeadState] with overridden properties.
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
      nameInput: nameInput ?? this.nameInput,
      phoneInput: phoneInput ?? this.phoneInput,
      emailInput: emailInput ?? this.emailInput,
      source: source ?? this.source,
      purpose: purpose ?? this.purpose,
      category: category ?? this.category,
      status: status ?? this.status,
      location: location ?? this.location,
      nextFollowUp: nextFollowUp != null ? nextFollowUp() : this.nextFollowUp,
      note: note != null ? note() : this.note,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error != null ? error() : this.error,
      lead: lead ?? this.lead,
    );
  }
}

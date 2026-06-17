part of 'add_lead_bloc.dart';

/// Form input fields for the Add Lead form.
class AddLeadFormInputs extends Equatable {
  final LeadName nameInput;
  final LeadPhone phoneInput;
  final LeadEmail emailInput;
  final LeadSource source;
  final LeadPurpose purpose;
  final LeadCategory category;
  final LeadStatus status;
  final String location;
  final String? nextFollowUp;
  final String? note;

  const AddLeadFormInputs({
    this.nameInput = const LeadName.pure(),
    this.phoneInput = const LeadPhone.pure(),
    this.emailInput = const LeadEmail.pure(),
    this.source = LeadSource.facebook,
    this.purpose = LeadPurpose.enquiry,
    this.category = LeadCategory.warm,
    this.status = LeadStatus.newStatus,
    this.location = 'Kochi',
    this.nextFollowUp,
    this.note,
  });

  AddLeadFormInputs copyWith({
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
  }) {
    return AddLeadFormInputs(
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
    );
  }

  @override
  List<Object?> get props => [nameInput, phoneInput, emailInput, source, purpose, category, status, location, nextFollowUp, note];
}

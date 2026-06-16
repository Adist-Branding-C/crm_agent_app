part of 'add_lead_bloc.dart';

/// Represents the state of the Add Lead form and submission status.
class AddLeadState extends Equatable {
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
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;
  final Lead? lead;

  /// Creates a constant [AddLeadState].
  const AddLeadState({
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
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
    this.lead,
  });

  String get name => nameInput.value;
  String get phone => phoneInput.value;
  String get email => emailInput.value;

  @override
  List<Object?> get props => [
        nameInput,
        phoneInput,
        emailInput,
        source,
        purpose,
        category,
        status,
        location,
        nextFollowUp,
        note,
        isSubmitting,
        isSuccess,
        error,
        lead,
      ];
}

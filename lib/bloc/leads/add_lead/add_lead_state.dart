part of 'add_lead_bloc.dart';

/// Represents the state of the Add Lead form and submission status.
class AddLeadState extends Equatable {
  /// Name input field.
  final LeadName nameInput;

  /// Phone input field.
  final LeadPhone phoneInput;

  /// Email input field.
  final LeadEmail emailInput;

  /// Selected lead source.
  final LeadSource source;

  /// Selected lead purpose.
  final LeadPurpose purpose;

  /// Selected lead category.
  final LeadCategory category;

  /// Selected lead status.
  final LeadStatus status;

  /// Selected lead location.
  final String location;

  /// The next follow up date.
  final String? nextFollowUp;

  /// The optional lead note.
  final String? note;

  /// Submitting status indicator.
  final bool isSubmitting;

  /// Success status indicator.
  final bool isSuccess;

  /// Optional submission error.
  final String? error;

  /// The created lead object.
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

  /// The name field string value.
  String get name => nameInput.value;

  /// The phone field string value.
  String get phone => phoneInput.value;

  /// The email field string value.
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

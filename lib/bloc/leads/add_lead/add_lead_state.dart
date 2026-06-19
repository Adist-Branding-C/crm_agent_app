import 'package:equatable/equatable.dart';
import '../leads_enums.dart';
import '../leads_models.dart';
import 'lead_name_input.dart';
import 'lead_phone_input.dart';
import 'lead_email_input.dart';

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

/// Submission lifecycle status for the Add Lead form.
class AddLeadSubmissionStatus extends Equatable {
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;
  final Lead? lead;

  const AddLeadSubmissionStatus({
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
    this.lead,
  });

  AddLeadSubmissionStatus copyWith({
    bool? isSubmitting,
    bool? isSuccess,
    String? Function()? error,
    Lead? lead,
  }) {
    return AddLeadSubmissionStatus(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error != null ? error() : this.error,
      lead: lead ?? this.lead,
    );
  }

  @override
  List<Object?> get props => [isSubmitting, isSuccess, error, lead];
}

/// Composed state for the Add Lead form (inputs + submission status).
class AddLeadState extends Equatable {
  final AddLeadFormInputs formInputs;
  final AddLeadSubmissionStatus submission;

  const AddLeadState({
    this.formInputs = const AddLeadFormInputs(),
    this.submission = const AddLeadSubmissionStatus(),
  });

  // Forwarding getters for backward compatibility
  LeadName get nameInput => formInputs.nameInput;
  LeadPhone get phoneInput => formInputs.phoneInput;
  LeadEmail get emailInput => formInputs.emailInput;
  LeadSource get source => formInputs.source;
  LeadPurpose get purpose => formInputs.purpose;
  LeadCategory get category => formInputs.category;
  LeadStatus get status => formInputs.status;
  String get location => formInputs.location;
  String? get nextFollowUp => formInputs.nextFollowUp;
  String? get note => formInputs.note;
  bool get isSubmitting => submission.isSubmitting;
  bool get isSuccess => submission.isSuccess;
  String? get error => submission.error;
  Lead? get lead => submission.lead;

  String get name => nameInput.value;
  String get phone => phoneInput.value;
  String get email => emailInput.value;

  @override
  List<Object?> get props => [formInputs, submission];
}

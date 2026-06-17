part of 'add_lead_bloc.dart';

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

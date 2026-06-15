part of 'add_lead_bloc.dart';

/// Event dispatched to submit the Add Lead form.
class SubmitForm extends AddLeadEvent {
  /// The input lead name.
  final String name;

  /// The input lead phone.
  final String phone;

  /// The input lead email.
  final String email;

  /// The input lead location.
  final String location;

  /// The selected source.
  final LeadSource source;

  /// The selected purpose.
  final LeadPurpose purpose;

  /// The selected category.
  final LeadCategory category;

  /// The selected status.
  final LeadStatus status;

  /// The next follow up date.
  final String? nextFollowUp;

  /// The optional lead note.
  final String? note;

  /// Creates a constant [SubmitForm] event.
  const SubmitForm({
    required this.name,
    required this.phone,
    required this.email,
    required this.location,
    required this.source,
    required this.purpose,
    required this.category,
    required this.status,
    this.nextFollowUp,
    this.note,
  });

  @override
  List<Object?> get props => [
        name,
        phone,
        email,
        location,
        source,
        purpose,
        category,
        status,
        nextFollowUp,
        note,
      ];
}

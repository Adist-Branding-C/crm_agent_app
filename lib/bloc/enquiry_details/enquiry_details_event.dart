import 'package:equatable/equatable.dart';
import '../leads/leads_enums.dart';

/// Base event class for Enquiry Details BLoC.
abstract class EnquiryDetailsEvent extends Equatable {
  const EnquiryDetailsEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load lead details.
class LoadEnquiryDetails extends EnquiryDetailsEvent {
  final String leadId;
  const LoadEnquiryDetails(this.leadId);

  @override
  List<Object?> get props => [leadId];
}

/// Event to change lead status.
class ChangeEnquiryStatus extends EnquiryDetailsEvent {
  final LeadStatus status;
  const ChangeEnquiryStatus(this.status);

  @override
  List<Object?> get props => [status];
}

/// Event to add a note.
class AddEnquiryNote extends EnquiryDetailsEvent {
  final String content;
  const AddEnquiryNote(this.content);

  @override
  List<Object?> get props => [content];
}

/// Event to delete a lead.
class DeleteEnquiry extends EnquiryDetailsEvent {
  const DeleteEnquiry();
}

/// Event to update enquiry details.
class UpdateEnquiryDetails extends EnquiryDetailsEvent {
  final String name;
  final String phone;
  final String? email;
  final String location;
  final LeadSource source;
  final LeadPurpose purpose;
  final LeadCategory category;
  final LeadStatus status;
  final String? nextFollowUp;
  final String? note;

  const UpdateEnquiryDetails({
    required this.name,
    required this.phone,
    this.email,
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

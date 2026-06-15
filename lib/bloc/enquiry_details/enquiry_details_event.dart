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

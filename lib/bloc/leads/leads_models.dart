import 'package:equatable/equatable.dart';
import 'leads_enums.dart';

/// Representation of a sales lead.
class Lead extends Equatable {
  /// Unique identifier of the lead.
  final String id;

  /// Name of the lead.
  final String name;

  /// Status of the lead.
  final LeadStatus status;

  /// Acquisition source (e.g. Enquiry, Demo Request).
  final LeadPurpose source;

  /// Rating category: Hot, Warm, Cold.
  final LeadCategory category;

  /// Contact phone number.
  final String phone;

  /// Physical location or city of the lead.
  final String location;

  /// Optional contact email address.
  final String? email;

  /// Optional lead acquisition source channel (e.g. Facebook, Website).
  final LeadSource? leadSource;

  /// Optional next follow up reminder text.
  final String? nextFollowUp;

  /// Optional note about the lead.
  final String? note;

  /// Creates a constant [Lead].
  const Lead({
    this.id = '',
    required this.name,
    required this.status,
    required this.source,
    required this.category,
    required this.phone,
    required this.location,
    this.email,
    this.leadSource,
    this.nextFollowUp,
    this.note,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        source,
        category,
        phone,
        location,
        email,
        leadSource,
        nextFollowUp,
        note,
      ];
}

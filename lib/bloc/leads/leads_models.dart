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
    required this.id,
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

  /// Computes the initials from the name.
  String get initials {
    if (name.isEmpty) return '';
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length > 1) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }

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

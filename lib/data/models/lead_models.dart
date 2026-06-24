import 'package:equatable/equatable.dart';
import 'lead_enums.dart';

class Lead extends Equatable {
  final String id;
  final String name;
  final LeadStatus status;
  final LeadPurpose source;
  final LeadCategory category;
  final String phone;
  final String location;
  final String? email;
  final LeadSource? leadSource;
  final String? nextFollowUp;
  final String? note;

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

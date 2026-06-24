import 'package:equatable/equatable.dart';
import 'lead_enums.dart';

enum FollowUpUrgency {
  overdue('overdue', 'Overdue'),
  dueToday('due_today', 'Due Today'),
  upcoming('upcoming', 'Upcoming');

  final String value;
  final String label;
  const FollowUpUrgency(this.value, this.label);
}

class FollowUp extends Equatable {
  final String id;
  final String name;
  final LeadPurpose category;
  final LeadStatus status;
  final FollowUpUrgency urgency;

  const FollowUp({
    required this.id,
    required this.name,
    required this.category,
    required this.status,
    required this.urgency,
  });

  String get initials {
    if (name.trim().isEmpty) return '';
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length > 1) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }

  @override
  List<Object?> get props => [id, name, category, status, urgency];
}

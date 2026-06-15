import 'package:equatable/equatable.dart';
import '../leads/leads_enums.dart';

/// Urgency group for follow-ups.
enum FollowUpUrgency {
  overdue('overdue', 'Overdue'),
  dueToday('due_today', 'Due Today'),
  upcoming('upcoming', 'Upcoming');

  final String value;
  final String label;
  const FollowUpUrgency(this.value, this.label);
}

/// Model representing a detailed follow-up call.
class FollowUp extends Equatable {
  /// Unique identifier of the follow-up.
  final String id;

  /// Full name of the contact.
  final String name;

  /// Business category of the contact.
  final LeadPurpose category;

  /// Status of the follow-up.
  final LeadStatus status;

  /// Urgency group.
  final FollowUpUrgency urgency;

  /// Creates a constant [FollowUp] model.
  const FollowUp({
    required this.id,
    required this.name,
    required this.category,
    required this.status,
    required this.urgency,
  });

  /// Computes the avatar initials (e.g., "Vishnu Prasad" -> "VP").
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

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
  final DateTime scheduledTime;

  const FollowUp({
    required this.id,
    required this.name,
    required this.category,
    required this.status,
    required this.scheduledTime,
  });

  FollowUpUrgency get urgency {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final targetDate = DateTime(scheduledTime.year, scheduledTime.month, scheduledTime.day);

    if (targetDate == today) {
      return FollowUpUrgency.dueToday;
    } else if (scheduledTime.isBefore(now)) {
      return FollowUpUrgency.overdue;
    } else {
      return FollowUpUrgency.upcoming;
    }
  }

  String get initials {
    if (name.trim().isEmpty) return '';
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length > 1) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0][0].toUpperCase();
  }

  @override
  List<Object?> get props => [id, name, category, status, scheduledTime];
}

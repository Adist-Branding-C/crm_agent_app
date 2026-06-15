import 'package:equatable/equatable.dart';

/// Model representing a detailed follow-up call.
class FollowUp extends Equatable {
  /// Unique identifier of the follow-up.
  final String id;

  /// Full name of the contact.
  final String name;

  /// Business category of the contact (e.g. Enquiry, New Admission).
  final String category;

  /// Status of the follow-up (e.g. Follow Up, Interested, Qualified).
  final String status;

  /// Urgency group ('overdue', 'due_today', 'upcoming').
  final String urgency;

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

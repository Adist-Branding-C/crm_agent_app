import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Renders a section header with colored icon and count badge.
class FollowUpSectionHeader extends StatelessWidget {
  /// Section display title.
  final String title;

  /// Count of elements in this section.
  final int count;

  /// Section category ('overdue', 'due_today', 'upcoming').
  final String urgency;

  /// Creates a constant [FollowUpSectionHeader].
  const FollowUpSectionHeader({
    super.key,
    required this.title,
    required this.count,
    required this.urgency,
  });

  @override
  Widget build(BuildContext context) {
    final isUpcoming = urgency == 'upcoming';
    final iconData = isUpcoming
        ? Icons.calendar_month_rounded
        : (urgency == 'due_today'
            ? Icons.access_time_rounded
            : Icons.warning_amber_rounded);
    
    final iconColor = isUpcoming ? const Color(0xFF3B82F6) : const Color(0xFFEF4444);
    final badgeBg = isUpcoming ? const Color(0xFFE0F2FE) : const Color(0xFFFEE2E2);
    final badgeText = isUpcoming ? const Color(0xFF0284C7) : const Color(0xFFEF4444);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Icon(iconData, color: iconColor, size: 16),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: badgeBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '$count',
              style: TextStyle(
                color: badgeText,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../bloc/follow_ups/follow_ups_models.dart';
import '../../../theme.dart';
import '../../dashboard/widgets/call_button.dart';

/// Renders a single contact row card with initials avatar and a call button.
class FollowUpItemCard extends StatelessWidget {
  /// The follow-up model data to display.
  final FollowUp call;

  /// Callback when the call button is pressed.
  final VoidCallback onTap;

  /// Creates a constant [FollowUpItemCard].
  const FollowUpItemCard({
    super.key,
    required this.call,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.primaryColorLight,
            child: Text(
              call.initials,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  call.name,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${call.category} · ${call.status}',
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          CallButton(onTap: onTap),
        ],
      ),
    );
  }
}

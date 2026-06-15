import 'package:flutter/material.dart';
import '../../../bloc/follow_ups/follow_ups_models.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/user_avatar.dart';
import '../../../widgets/call_button.dart';
import '../../../theme.dart';

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
    return CustomCard(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          UserAvatar(
            initials: call.initials,
            size: 44,
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

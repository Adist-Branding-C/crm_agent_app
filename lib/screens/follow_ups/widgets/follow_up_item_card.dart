import 'package:flutter/material.dart';
import '../../../bloc/follow_ups/follow_ups_models.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/user_avatar.dart';
import '../../../widgets/call_button.dart';

/// Renders a single contact row card with initials avatar and a call button.
class FollowUpItemCard extends StatelessWidget {
  /// The follow-up model data to display.
  final FollowUp call;

  /// Callback when the call button is pressed.
  final VoidCallback onCallTap;

  /// Callback when the name or card is tapped (e.g. navigate to details).
  final VoidCallback? onCardTap;

  /// Creates a constant [FollowUpItemCard].
  const FollowUpItemCard({
    super.key,
    required this.call,
    required this.onCallTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: AppSpacing.cardMarginList,
      padding: AppSpacing.cardPadding,
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
                GestureDetector(
                  onTap: onCardTap,
                    child: Text(
                      call.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${call.category} · ${call.status}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          CallButton(onTap: onCallTap),
        ],
      ),
    );
  }
}

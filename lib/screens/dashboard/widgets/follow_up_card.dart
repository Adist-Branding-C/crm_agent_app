import 'package:flutter/material.dart';
import '../../../bloc/dashboard/dashboard_models.dart';
import '../../../theme.dart';
import '../../../widgets/call_button.dart';

/// Renders a single row in the follow-up calls list.
class FollowUpCard extends StatelessWidget {
  final FollowUpCall call;

  /// Creates a constant [FollowUpCard].
  const FollowUpCard({super.key, required this.call});

  @override
  Widget build(BuildContext context) {
    final isPriority = call.tag == FollowUpTag.priority;
    final tagBg = isPriority
        ? AppColors.primaryColorLight
        : AppColors.warningBackground;
    final tagText = isPriority
        ? AppColors.primaryColor
        : AppColors.warning;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: tagBg,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    call.tag.label,
                    style: TextStyle(
                      color: tagText,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  call.name,
                  style: const TextStyle(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  call.time,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const CallButton(),
        ],
      ),
    );
  }
}

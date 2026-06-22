import 'package:flutter/material.dart';
import '../bloc/leads/leads_models.dart';
import '../theme.dart';
import 'bottom_sheet_handle.dart';
import 'user_avatar.dart';

/// The header layout of the call actions bottom sheet showing lead info.
class CallActionsSheetHeader extends StatelessWidget {
  /// The target lead.
  final Lead lead;

  /// Creates a constant [CallActionsSheetHeader].
  const CallActionsSheetHeader({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        const BottomSheetHandle(),
        const SizedBox(height: 20),
        Row(
          children: [
            UserAvatar(
              initials: UserAvatar.initialsFromName(lead.name),
              size: 48,
              backgroundColor: AppColors.primaryColorLight,
              textColor: AppColors.primaryColor,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lead.name,
                    style: const TextStyle(
                      color: AppColors.textDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    lead.location,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(color: AppColors.borderLight, height: 1),
      ],
    );
  }
}

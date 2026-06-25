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
        const BottomSheetHandle(),
        AppSpacing.gapXl,
        Row(
          children: [
            UserAvatar(
              initials: UserAvatar.initialsFromName(lead.name),
              size: 48,
              backgroundColor: AppColors.primaryColorLight,
              textColor: AppColors.primaryColor,
            ),
            AppSpacing.gapWLg,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lead.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppSpacing.gapXxs,
                  Text(
                    lead.location,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        AppSpacing.gapLg,
        const Divider(color: AppColors.borderLight, height: 1),
      ],
    );
  }
}

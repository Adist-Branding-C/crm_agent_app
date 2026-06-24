import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../theme.dart';
import '../../../widgets/user_avatar.dart';

class AddDealLeadCard extends StatelessWidget {
  final Lead lead;

  const AddDealLeadCard({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.slate50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          UserAvatar(
            initials: lead.name.split(' ').map((e) => e.isNotEmpty ? e[0] : '').take(2).join(),
            size: 40,
          ),
          AppSpacing.gapWMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lead.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${lead.source.label} · ${lead.phone}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
            decoration: BoxDecoration(
              color: AppColors.primaryColorLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
                'Linked enquiry',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
        ],
      ),
    );
  }
}

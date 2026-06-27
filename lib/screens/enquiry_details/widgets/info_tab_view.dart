import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../theme.dart';
import 'info_item_tile.dart';
import 'status_selector.dart';

/// Renders the Info Tab containing all the descriptive fields of a lead.
class InfoTabView extends StatelessWidget {
  final Lead lead;
  const InfoTabView({super.key, required this.lead});

  @override
  Widget build(BuildContext context) {
    const sourceFallback = 'Website';
    const followUpFallback = 'Today, 5:30 PM';
    const remarkFallback = 'Comparing with competitor. Needs pricing sheet.';

    return ListView(
      padding: AppSpacing.fabBottomPadding,
      children: [
        InfoItemTile(
          label: 'Enquiry Source',
          value: lead.leadSource?.label ?? sourceFallback,
        ),
        InfoItemTile(label: 'Purpose', value: lead.source.label),
        InfoItemTile(
          label: 'Enquiry Status',
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.ten,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: AppColors.warningTextBackground,
              borderRadius: BorderRadius.circular(6.w),
            ),
            child: Text(
              lead.status.label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.warningText,
                fontWeight: FontWeight.bold,
                fontSize: 10.s
              ),
            ),
          ),
        ),
        const InfoItemTile(label: 'Agent', value: 'Arjun Nair'),
        InfoItemTile(label: 'Type', value: lead.category.label),
        InfoItemTile(label: 'Location', value: lead.location),
        InfoItemTile(
          label: 'Next Follow-up',
          value: lead.nextFollowUp ?? followUpFallback,
          valueColor: AppColors.primaryColor,
        ),
        InfoItemTile(label: 'Remarks', value: lead.note ?? remarkFallback),
        AppSpacing.gapLg,
        OutlinedButton.icon(
          onPressed: () => showStatusSelector(context),
          icon:  Icon(Icons.sync, size: 17.s),
          label:  Text('Change Status',style: TextStyle(fontSize: 14.s),),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
            side: const BorderSide(color: AppColors.borderLight),
            padding: EdgeInsets.symmetric(vertical: AppSpacing.fourteen),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
        ),
      ],
    );
  }
}

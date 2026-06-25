import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../data/models/activity_models.dart';
import '../../../theme.dart';
import 'call_summary_card.dart';
import 'log_details_section.dart';
import 'remark_section.dart';

class ViewCallLogBody extends StatelessWidget {
  final Lead lead;
  final EnquiryActivity activity;

  const ViewCallLogBody({
    super.key,
    required this.lead,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lead: ${lead.name}',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.w600,
            ),
          ),
          AppSpacing.gapLg,
          CallSummaryCard(activity: activity),
          AppSpacing.gapLg,
          LogDetailsSection(activity: activity),
          AppSpacing.gapLg,
          RemarkSection(activity: activity),
          AppSpacing.gapLg,
        ],
      ),
    );
  }
}

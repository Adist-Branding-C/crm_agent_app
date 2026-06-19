import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/page_scaffold.dart';
import 'models/call_status_item.dart';
import 'models/lead_status_item.dart';
import 'widgets/call_report_header.dart';
import 'widgets/call_status_list.dart';
import 'widgets/lead_status_breakdown_card.dart';

/// The Call Report screen showing call outcome stats and lead status breakdown.
class CallReportScreen extends StatelessWidget {
  const CallReportScreen({super.key});

  static const _callStatuses = [
    CallStatusItem(
      label: 'Connected',
      count: 72,
      percentage: 56,
      color: AppColors.success,
    ),
    CallStatusItem(
      label: 'Not Answered',
      count: 24,
      percentage: 19,
      color: AppColors.warning,
    ),
    CallStatusItem(
      label: 'Busy',
      count: 14,
      percentage: 11,
      color: AppColors.info,
    ),
    CallStatusItem(
      label: 'Switched Off',
      count: 11,
      percentage: 9,
      color: AppColors.slate400,
    ),
    CallStatusItem(
      label: 'Wrong Number',
      count: 4,
      percentage: 3,
      color: AppColors.errorColor,
    ),
    CallStatusItem(
      label: 'Call Back Later',
      count: 3,
      percentage: 2,
      color: AppColors.accent,
    ),
  ];

  static const _leadStatuses = [
    LeadStatusItem(label: 'Interested', count: 14, color: AppColors.success),
    LeadStatusItem(label: 'Follow Up', count: 7, color: AppColors.warning),
    LeadStatusItem(label: 'New', count: 9, color: AppColors.info),
    LeadStatusItem(label: 'Qualified', count: 6, color: AppColors.accent),
    LeadStatusItem(
      label: 'Not Interested',
      count: 2,
      color: AppColors.slate400,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          const CallReportHeader(title: 'Call Report', subtitle: 'This month'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: const [
                  CallStatusList(items: _callStatuses, totalCalls: 128),
                  SizedBox(height: 16),
                  LeadStatusBreakdownCard(
                    items: _leadStatuses,
                    totalLeads: 38,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

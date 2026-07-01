import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import 'models/call_report_data.dart';
import 'widgets/call_status_list.dart';
import 'widgets/lead_status_breakdown_card.dart';

class CallReportScreen extends StatelessWidget {
  const CallReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ScreenHeader(
            title: 'Call Report',
            subtitle: 'This month',
            padding: EdgeInsets.fromLTRB(17.0.w, 20.0.h, 17.0.w, 13.0.h),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: AppSpacing.xxl),
              child: Column(
                children: const [
                  CallStatusList(
                    items: CallReportData.callStatuses,
                    totalCalls: CallReportData.totalCalls,
                  ),
                  SizedBox(height: 16),
                  LeadStatusBreakdownCard(
                    items: CallReportData.leadStatuses,
                    totalLeads: CallReportData.totalLeads,
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

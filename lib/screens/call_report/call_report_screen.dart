import 'package:flutter/material.dart';
import '../../widgets/page_scaffold.dart';
import 'models/call_report_data.dart';
import 'widgets/call_report_header.dart';
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
          const CallReportHeader(title: 'Call Report', subtitle: 'This month'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: const [
                  CallStatusList(items: CallReportData.callStatuses, totalCalls: CallReportData.totalCalls),
                  SizedBox(height: 16),
                  LeadStatusBreakdownCard(items: CallReportData.leadStatuses, totalLeads: CallReportData.totalLeads),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import '../../../theme/app_colors.dart';
import 'call_status_item.dart';
import 'lead_status_item.dart';

class CallReportData {
  CallReportData._();

  static const callStatuses = [
    CallStatusItem(label: 'Connected', count: 72, percentage: 56, color: AppColors.success),
    CallStatusItem(label: 'Not Answered', count: 24, percentage: 19, color: AppColors.warning),
    CallStatusItem(label: 'Busy', count: 14, percentage: 11, color: AppColors.info),
    CallStatusItem(label: 'Switched Off', count: 11, percentage: 9, color: AppColors.slate400),
    CallStatusItem(label: 'Wrong Number', count: 4, percentage: 3, color: AppColors.errorColor),
    CallStatusItem(label: 'Call Back Later', count: 3, percentage: 2, color: AppColors.accent),
  ];

  static const totalCalls = 128;

  static const leadStatuses = [
    LeadStatusItem(label: 'Interested', count: 14, color: AppColors.success),
    LeadStatusItem(label: 'Follow Up', count: 7, color: AppColors.warning),
    LeadStatusItem(label: 'New', count: 9, color: AppColors.info),
    LeadStatusItem(label: 'Qualified', count: 6, color: AppColors.accent),
    LeadStatusItem(label: 'Not Interested', count: 2, color: AppColors.slate400),
  ];

  static const totalLeads = 38;
}

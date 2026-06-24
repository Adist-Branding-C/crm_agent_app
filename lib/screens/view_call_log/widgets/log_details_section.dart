import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../data/models/activity_models.dart';
import '../../../theme.dart';
import 'log_details_colors.dart';
import 'log_details_row.dart';

class LogDetailsSection extends StatelessWidget {
  final EnquiryActivity activity;
  const LogDetailsSection({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    final status = activity.leadStatus ?? LeadStatus.interested;
    final purpose = activity.purpose ?? LeadPurpose.newAdmission;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Log Details',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        LogDetailsRow(
          label: 'Lead Status',
          value: status.label,
          colors: getStatusColors(status),
        ),
        const SizedBox(height: 12),
        LogDetailsRow(
          label: 'Purpose',
          value: purpose.label,
          colors: getPurposeColors(purpose),
        ),
      ],
    );
  }
}

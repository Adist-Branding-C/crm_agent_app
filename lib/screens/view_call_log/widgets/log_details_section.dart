import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../data/models/activity_models.dart';
import '../../../theme.dart';

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
        Text('Log Details', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.textDark, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        _buildRow(context, 'Lead Status', status.label, _getStatusColors(status)),
        const SizedBox(height: 12),
        _buildRow(context, 'Purpose', purpose.label, _getPurposeColors(purpose)),
      ],
    );
  }

  Widget _buildRow(BuildContext context, String label, String value, List<Color> colors) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.borderLight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textDark, fontWeight: FontWeight.w500)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: colors[1], borderRadius: BorderRadius.circular(8), border: Border.all(color: colors[2])),
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colors[0], fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  List<Color> _getStatusColors(LeadStatus status) {
    if (status == LeadStatus.interested || status == LeadStatus.converted || status == LeadStatus.qualified) {
      return [AppColors.success, AppColors.successBackground, AppColors.successAlpha15];
    }
    if (status == LeadStatus.notInterested || status == LeadStatus.lost) {
      return [AppColors.errorColor, AppColors.errorBackground, AppColors.errorBorder];
    }
    return [AppColors.infoText, AppColors.infoBackgroundLight, AppColors.infoAlpha15];
  }

  List<Color> _getPurposeColors(LeadPurpose purpose) {
    if (purpose == LeadPurpose.newAdmission) {
      return [AppColors.primaryColor, AppColors.primaryColorLight, AppColors.primaryAlpha30];
    }
    if (purpose == LeadPurpose.enquiry) {
      return [AppColors.infoText, AppColors.infoBackgroundLight, AppColors.infoAlpha15];
    }
    return [AppColors.warningText, AppColors.warningTextBackground, AppColors.warningAlpha15];
  }
}

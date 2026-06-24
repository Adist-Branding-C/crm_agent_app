import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../theme/app_spacing.dart';
import 'status_label.dart';
import 'status_chip.dart';

class StatusSelector extends StatelessWidget {
  final String selectedCallStatus;
  final ValueChanged<String> onCallStatusChanged;
  final LeadStatus selectedLeadStatus;
  final ValueChanged<LeadStatus> onLeadStatusChanged;

  const StatusSelector({
    super.key,
    required this.selectedCallStatus,
    required this.onCallStatusChanged,
    required this.selectedLeadStatus,
    required this.onLeadStatusChanged,
  });

  static const _callStatuses = [
    'Connected',
    'Not Answered',
    'Busy',
    'Switched Off',
    'Wrong Number',
    'Call Back Later',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StatusLabel(text: 'Call Status'),
          AppSpacing.gapSm,
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: _callStatuses
                .map(
                  (s) => StatusChip(
                    label: s,
                    isSelected: s == selectedCallStatus,
                    onTap: () => onCallStatusChanged(s),
                  ),
                )
                .toList(),
          ),
          AppSpacing.gapLg,
          const StatusLabel(text: 'Lead Status'),
          AppSpacing.gapSm,
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: LeadStatus.values
                .where((v) => v != LeadStatus.lost)
                .map(
                  (s) => StatusChip(
                    label: s.label,
                    isSelected: s == selectedLeadStatus,
                    onTap: () => onLeadStatusChanged(s),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

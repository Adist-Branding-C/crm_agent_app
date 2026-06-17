import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
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

  static const _callStatuses = ['Connected', 'Not Answered', 'Busy', 'Switched Off', 'Wrong Number', 'Call Back Later'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StatusLabel(text: 'Call Status'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _callStatuses.map((s) => StatusChip(label: s, isSelected: s == selectedCallStatus, onTap: () => onCallStatusChanged(s))).toList(),
          ),
          const SizedBox(height: 16),
          const StatusLabel(text: 'Lead Status'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: LeadStatus.values.where((v) => v != LeadStatus.lost).map((s) => StatusChip(label: s.label, isSelected: s == selectedLeadStatus, onTap: () => onLeadStatusChanged(s))).toList(),
          ),
        ],
      ),
    );
  }
}

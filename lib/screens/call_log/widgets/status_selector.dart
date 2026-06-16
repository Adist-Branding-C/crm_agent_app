import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../theme/app_colors.dart';

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
          _buildLabel('Call Status'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _callStatuses.map((s) => _buildChip(s, s == selectedCallStatus, () => onCallStatusChanged(s))).toList(),
          ),
          const SizedBox(height: 16),
          _buildLabel('Lead Status'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: LeadStatus.values.where((v) => v != LeadStatus.lost).map((s) => _buildChip(s.label, s == selectedLeadStatus, () => onLeadStatusChanged(s))).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Row(
      children: [
        Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textDark)),
        const Text(' *', style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildChip(String label, bool isSel, VoidCallback onTap) {
    return ChoiceChip(
      label: Text(label),
      selected: isSel,
      onSelected: (_) => onTap(),
      selectedColor: AppColors.successBackground,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSel ? AppColors.success : AppColors.textMuted,
        fontWeight: isSel ? FontWeight.w600 : FontWeight.normal,
        fontSize: 13,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: isSel ? AppColors.success : Colors.grey.shade200, width: isSel ? 1.5 : 1),
      ),
      showCheckmark: false,
    );
  }
}

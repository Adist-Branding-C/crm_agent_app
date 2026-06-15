import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';

/// Renders status chips styled with distinct colors matching design specs.
class FilterStatus extends StatelessWidget {
  /// The currently selected status filter value.
  final LeadStatus? selectedStatus;

  /// Callback when a status is toggled.
  final ValueChanged<LeadStatus?> onSelected;

  /// Creates a constant [FilterStatus].
  const FilterStatus({
    super.key,
    required this.selectedStatus,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final statuses = LeadStatus.values.where((e) => e != LeadStatus.lost).toList();
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: statuses.map((status) {
        final isSel = selectedStatus == status;
        final cfg = _getChipConfig(status);
        return GestureDetector(
          onTap: () => onSelected(isSel ? null : status),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: cfg.bgColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSel ? cfg.textColor : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Text(
              status.label,
              style: TextStyle(
                color: cfg.textColor,
                fontSize: 13,
                fontWeight: isSel ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  _ChipConfig _getChipConfig(LeadStatus status) {
    switch (status) {
      case LeadStatus.newStatus:
        return const _ChipConfig(Color(0xFFEFF6FF), Color(0xFF2563EB));
      case LeadStatus.interested:
        return const _ChipConfig(Color(0xFFECFDF5), Color(0xFF10B981));
      case LeadStatus.qualified:
        return const _ChipConfig(Color(0xFFF5F3FF), Color(0xFF8B5CF6));
      case LeadStatus.followUp:
        return const _ChipConfig(Color(0xFFFEF3C7), Color(0xFFD97706));
      case LeadStatus.notInterested:
        return const _ChipConfig(Color(0xFFF3F4F6), Color(0xFF4B5563));
      case LeadStatus.converted:
        return const _ChipConfig(Color(0xFFE6FFFA), Color(0xFF0D9488));
      default:
        return const _ChipConfig(Color(0xFFF3F4F6), Color(0xFF475569));
    }
  }
}

class _ChipConfig {
  final Color bgColor;
  final Color textColor;
  const _ChipConfig(this.bgColor, this.textColor);
}

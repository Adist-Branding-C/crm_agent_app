import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import 'filter_status_helpers.dart';

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
        final cfg = getChipConfig(status);
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
}

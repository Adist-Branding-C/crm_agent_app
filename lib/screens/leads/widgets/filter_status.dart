import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../widgets/lead_presentation_extensions.dart';
import '../../../theme.dart';

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
    final statuses = LeadStatus.values
        .where((e) => e != LeadStatus.lost)
        .toList();
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: statuses.map((status) {
        final isSel = selectedStatus == status;
        final cfg = status.chipConfig;
        return GestureDetector(
          onTap: () => onSelected(isSel ? null : status),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs2,
            ),
            decoration: BoxDecoration(
              color: cfg.bgColor,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: isSel ? cfg.textColor : Colors.transparent,
                width: 1.5,
              ),
            ),
            child: Text(
              status.label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: cfg.textColor,
              fontWeight: isSel ? FontWeight.bold : FontWeight.w500,
            ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

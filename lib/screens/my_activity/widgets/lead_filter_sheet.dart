import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/bottom_sheet_handle.dart';
import 'filter_sheet_all_leads_row.dart';
import 'filter_sheet_lead_row.dart';
import 'filter_sheet_title.dart';

class LeadFilterSheet extends StatelessWidget {
  final String selectedLead;
  final List<String> availableLeads;
  final ValueChanged<String?> onSelected;

  const LeadFilterSheet({
    super.key,
    required this.selectedLead,
    required this.availableLeads,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.72,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.gapMd,
            const BottomSheetHandle(),
            AppSpacing.gapLg,
            const FilterSheetTitle(),
            AppSpacing.gapSm,
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  FilterSheetAllLeadsRow(
                    isSelected: selectedLead == 'All leads',
                    onTap: () => onSelected('All leads'),
                  ),
                  ...availableLeads.map(
                    (n) => FilterSheetLeadRow(
                      name: n,
                      isSelected: selectedLead == n,
                      onTap: () => onSelected(n),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

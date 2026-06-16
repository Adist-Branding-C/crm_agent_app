part of 'add_lead_selection_fields.dart';

class _CategoryStatusFields extends StatelessWidget {
  final LeadCategory category;
  final ValueChanged<LeadCategory> onCategoryChanged;
  final LeadStatus status;
  final ValueChanged<LeadStatus> onStatusChanged;

  const _CategoryStatusFields({
    required this.category,
    required this.onCategoryChanged,
    required this.status,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectionGroup(
          label: 'Lead Type',
          options: LeadCategory.values.map((e) => e.label).toList(),
          selectedOption: category.label,
          onSelected: (val) => onCategoryChanged(
            LeadCategory.values.firstWhere((e) => e.label == val),
          ),
        ),
        const SizedBox(height: 16),
        SelectionGroup(
          label: 'Status',
          options: const ['New', 'Interested', 'Qualified', 'Follow Up'],
          selectedOption: status.label,
          onSelected: (val) => onStatusChanged(
            LeadStatus.values.firstWhere((e) => e.label == val),
          ),
        ),
      ],
    );
  }
}

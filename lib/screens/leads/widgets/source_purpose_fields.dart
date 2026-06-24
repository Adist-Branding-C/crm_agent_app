part of 'add_lead_selection_fields.dart';

class _SourcePurposeFields extends StatelessWidget {
  final LeadSource source;
  final ValueChanged<LeadSource> onSourceChanged;
  final LeadPurpose purpose;
  final ValueChanged<LeadPurpose> onPurposeChanged;

  const _SourcePurposeFields({
    required this.source,
    required this.onSourceChanged,
    required this.purpose,
    required this.onPurposeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectionGroup(
          label: 'Source',
          options: LeadSource.values.map((e) => e.label).toList(),
          selectedOption: source.label,
          onSelected: (val) => onSourceChanged(
            LeadSource.values.firstWhere((e) => e.label == val),
          ),
        ),
        AppSpacing.gapLg,
        SelectionGroup(
          label: 'Purpose',
          options: LeadPurpose.values.map((e) => e.label).toList(),
          selectedOption: purpose.label,
          onSelected: (val) => onPurposeChanged(
            LeadPurpose.values.firstWhere((e) => e.label == val),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../widgets/selection_group.dart';

/// Selection options (Source, Purpose, Type, Status) fields section.
class AddLeadSelectionFields extends StatelessWidget {
  /// Selected source value.
  final String source;

  /// Callback on source change.
  final ValueChanged<String> onSourceChanged;

  /// Selected purpose value.
  final String purpose;

  /// Callback on purpose change.
  final ValueChanged<String> onPurposeChanged;

  /// Selected lead type.
  final String category;

  /// Callback on category change.
  final ValueChanged<String> onCategoryChanged;

  /// Selected status.
  final String status;

  /// Callback on status change.
  final ValueChanged<String> onStatusChanged;

  /// Creates a constant [AddLeadSelectionFields].
  const AddLeadSelectionFields({
    super.key,
    required this.source,
    required this.onSourceChanged,
    required this.purpose,
    required this.onPurposeChanged,
    required this.category,
    required this.onCategoryChanged,
    required this.status,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectionGroup(
            label: 'Source',
            options: const [
              'Facebook',
              'Website',
              'Referral',
              'Instagram',
              'Walk-in',
              'Google Ads',
            ],
            selectedOption: source,
            onSelected: onSourceChanged,
          ),
          const SizedBox(height: 16),
          SelectionGroup(
            label: 'Purpose',
            options: const ['Enquiry', 'New Admission', 'Demo Request'],
            selectedOption: purpose,
            onSelected: onPurposeChanged,
          ),
          const SizedBox(height: 16),
          SelectionGroup(
            label: 'Lead Type',
            options: const ['Hot', 'Warm', 'Cold'],
            selectedOption: category,
            onSelected: onCategoryChanged,
          ),
          const SizedBox(height: 16),
          SelectionGroup(
            label: 'Status',
            options: const ['New', 'Interested', 'Qualified', 'Follow Up'],
            selectedOption: status,
            onSelected: onStatusChanged,
          ),
        ],
      ),
    );
  }
}

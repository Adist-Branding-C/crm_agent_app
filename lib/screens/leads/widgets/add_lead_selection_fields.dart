import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';

import 'source_purpose_fields.dart';
import 'category_status_fields.dart';

/// Selection options (Source, Purpose, Type, Status) fields section.
class AddLeadSelectionFields extends StatelessWidget {
  /// Selected source value.
  final LeadSource source;

  /// Callback on source change.
  final ValueChanged<LeadSource> onSourceChanged;

  /// Selected purpose value.
  final LeadPurpose purpose;

  /// Callback on purpose change.
  final ValueChanged<LeadPurpose> onPurposeChanged;

  /// Selected lead type.
  final LeadCategory category;

  /// Callback on category change.
  final ValueChanged<LeadCategory> onCategoryChanged;

  /// Selected status.
  final LeadStatus status;

  /// Callback on status change.
  final ValueChanged<LeadStatus> onStatusChanged;

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
    return CustomCard(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SourcePurposeFields(
            source: source,
            onSourceChanged: onSourceChanged,
            purpose: purpose,
            onPurposeChanged: onPurposeChanged,
          ),
          AppSpacing.gapLg,
          CategoryStatusFields(
            category: category,
            onCategoryChanged: onCategoryChanged,
            status: status,
            onStatusChanged: onStatusChanged,
          ),
        ],
      ),
    );
  }
}

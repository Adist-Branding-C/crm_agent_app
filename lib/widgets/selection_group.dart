import 'package:flutter/material.dart';
import '../theme.dart';
import 'selection_chip.dart';

/// A reusable group selection widget using rounded chips.
class SelectionGroup extends StatelessWidget {
  /// Header label text displayed above options.
  final String label;

  /// List of text choices.
  final List<String> options;

  /// The currently selected value.
  final String selectedOption;

  /// Callback dispatched upon selection changes.
  final ValueChanged<String> onSelected;

  /// Whether this selection is required (displays red asterisk).
  final bool isRequired;

  /// Creates a [SelectionGroup].
  const SelectionGroup({
    super.key,
    required this.label,
    required this.options,
    required this.selectedOption,
    required this.onSelected,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isRequired)
              Text(
                ' *',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        AppSpacing.gapSm,
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: options
              .map((opt) => SelectionChip(
                    option: opt,
                    selectedOption: selectedOption,
                    onSelected: onSelected,
                  ))
              .toList(),
        ),
      ],
    );
  }
}

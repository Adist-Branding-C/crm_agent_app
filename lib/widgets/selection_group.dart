import 'package:flutter/material.dart';
import '../theme.dart';

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
              style: const TextStyle(
                color: AppColors.textDark,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isRequired)
              const Text(
                ' *',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((opt) => _buildChip(opt)).toList(),
        ),
      ],
    );
  }

  Widget _buildChip(String opt) {
    final isSelected = opt == selectedOption;
    final color = isSelected ? AppColors.primaryColor : AppColors.borderLight;
    final textStyle = TextStyle(
      color: isSelected ? AppColors.primaryColor : AppColors.textMuted,
      fontWeight: FontWeight.w600,
      fontSize: 13,
    );

    return GestureDetector(
      onTap: () => onSelected(opt),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, width: isSelected ? 1.5 : 1),
        ),
        child: Text(opt, style: textStyle),
      ),
    );
  }
}

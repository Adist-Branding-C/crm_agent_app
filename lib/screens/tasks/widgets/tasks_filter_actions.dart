import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_button.dart';

/// Reset and Apply buttons located at the bottom of the filter sheet.
class TasksFilterActions extends StatelessWidget {
  final VoidCallback onReset;
  final VoidCallback onApply;

  const TasksFilterActions({
    super.key,
    required this.onReset,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.fourteen),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: const BorderSide(color: Colors.grey),
            ),
            onPressed: onReset,
            child: const Text(
              'Reset',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        AppSpacing.gapWLg,
        Expanded(
          flex: 2,
          child: CustomButton(
            text: 'Apply Filter',
            icon: Icons.filter_alt_outlined,
            onPressed: onApply,
          ),
        ),
      ],
    );
  }
}

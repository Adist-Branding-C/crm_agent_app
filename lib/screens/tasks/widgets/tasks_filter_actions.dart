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
        GestureDetector(
          onTap: onReset,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.r),
              border: Border.all(color: AppColors.darkBackground),
            ),
            width: 70.w,
            height: 65.h,
            child: Center(
              child: Text(
                'Reset',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.s,
                  fontWeight: FontWeight.bold,
                ),
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

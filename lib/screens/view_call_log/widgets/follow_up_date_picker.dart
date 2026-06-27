import 'package:flutter/material.dart';
import '../../../widgets/custom_text_field.dart';
import '../../tasks/widgets/add_task_date_picker_helper.dart';

/// Standalone date and time picker field for Follow-ups.
class FollowUpDatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<DateTime> onDateTimeSelected;

  const FollowUpDatePickerField({
    super.key,
    required this.controller,
    required this.onDateTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final dt = await AddTaskDatePickerHelper.pickDateTime(context);
        if (dt != null) {
          onDateTimeSelected(dt);
        }
      },
      child: AbsorbPointer(
        child: CustomTextField(
          label: 'When',
          hintText: 'Select date and time',
          controller: controller,
          isRequired: true,
        ),
      ),
    );
  }
}

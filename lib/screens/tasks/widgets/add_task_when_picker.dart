import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/tasks/add_task/add_task_bloc.dart';
import '../../../widgets/custom_text_field.dart';
import 'add_task_date_picker_helper.dart';

/// Interactive field displaying and picking task due date and time.
class AddTaskWhenPicker extends StatefulWidget {
  const AddTaskWhenPicker({super.key});

  @override
  State<AddTaskWhenPicker> createState() => _AddTaskWhenPickerState();
}

class _AddTaskWhenPickerState extends State<AddTaskWhenPicker> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: context.read<AddTaskBloc>().state.dueDate,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTaskBloc, AddTaskState>(
      listenWhen: (prev, curr) => prev.dueDate != curr.dueDate,
      listener: (context, state) => _controller.text = state.dueDate,
      child: GestureDetector(
        onTap: () => _selectDateTime(context),
        child: AbsorbPointer(
          child: CustomTextField(
            label: 'When',
            hintText: 'Select date and time',
            controller: _controller,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final dt = await AddTaskDatePickerHelper.pickDateTime(context);
    if (dt == null || !context.mounted) return;

    final formatted = AddTaskDatePickerHelper.format(dt);
    context.read<AddTaskBloc>().add(TaskDueDateChanged(formatted, dt));
  }
}

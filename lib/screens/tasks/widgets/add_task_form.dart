import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/tasks/add_task/add_task_bloc.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/responsive_width_container.dart';
import 'add_task_priority_selector.dart';
import 'add_task_type_selector.dart';
import 'add_task_when_picker.dart';

/// Composed form widget for entering new task information.
class AddTaskForm extends StatelessWidget {
  const AddTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskBloc, AddTaskState>(
      listenWhen: (prev, curr) =>
          prev.isSuccess != curr.isSuccess ||
          prev.errorMessage != curr.errorMessage,
      listener: (context, state) {
        if (state.isSuccess) {
          context.pop(true);
        } else if (state.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          child: ResponsiveWidthContainer(
            maxWidth: 480.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  label: 'Task title',
                  hintText: 'What needs doing?',
                  isRequired: true,
                  height: 70.h,
                  onChanged: (val) =>
                      context.read<AddTaskBloc>().add(TaskTitleChanged(val)),
                  errorText: state.title.displayError != null
                      ? 'Title cannot be empty'
                      : null,
                ),
                AppSpacing.gapLg,
                CustomTextField(
                  label: 'Description',
                  hintText: 'Add description (optional)',
                  maxLines: 3,
                  onChanged: (val) => context.read<AddTaskBloc>().add(
                    TaskDescriptionChanged(val),
                  ),
                ),
                AppSpacing.gapLg,
                const AddTaskTypeSelector(),
                AppSpacing.gapLg,
                const AddTaskWhenPicker(),
                AppSpacing.gapLg,
                const AddTaskPrioritySelector(),
                AppSpacing.gapXxl,
                CustomButton(
                  text: 'Add Task',
                  isLoading: state.isSubmitting,
                  onPressed: state.isValid
                      ? () => context.read<AddTaskBloc>().add(
                          const SubmitAddTask(),
                        )
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

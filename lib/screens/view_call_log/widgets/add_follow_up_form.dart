import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/follow_ups/add_follow_up_cubit.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../data/models/dashboard_models.dart';
import '../../../theme.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../tasks/widgets/add_task_date_picker_helper.dart';
import 'follow_up_date_picker.dart';
import 'follow_up_tag_selector.dart';

class AddFollowUpForm extends StatefulWidget {
  final Lead lead;
  const AddFollowUpForm({super.key, required this.lead});

  @override
  State<AddFollowUpForm> createState() => _AddFollowUpFormState();
}

class _AddFollowUpFormState extends State<AddFollowUpForm> {
  final _whenController = TextEditingController();
  DateTime? _selectedDateTime;
  FollowUpTag _selectedTag = FollowUpTag.followUp;

  @override
  void dispose() {
    _whenController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_selectedDateTime == null) return;
    context.read<AddFollowUpCubit>().submitFollowUp(
          lead: widget.lead,
          time: _whenController.text,
          scheduledTime: _selectedDateTime!,
          tag: _selectedTag,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddFollowUpCubit, AddFollowUpState>(
      listener: (context, state) {
        if (state is AddFollowUpSuccess) {
          context.pop(true);
        } else if (state is AddFollowUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final isSubmitting = state is AddFollowUpLoading;
        return SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.xxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                label: 'Lead Name',
                hintText: '',
                controller: TextEditingController(text: widget.lead.name),
              ),
              AppSpacing.gapLg,
              FollowUpDatePickerField(
                controller: _whenController,
                onDateTimeSelected: (dt) => setState(() {
                  _selectedDateTime = dt;
                  _whenController.text = AddTaskDatePickerHelper.format(dt);
                }),
              ),
              AppSpacing.gapLg,
              FollowUpTagSelector(
                selectedTag: _selectedTag,
                onChanged: (tag) => setState(() => _selectedTag = tag),
              ),
              AppSpacing.gapXxl,
              CustomButton(
                text: 'Create Follow-up',
                isLoading: isSubmitting,
                onPressed: _selectedDateTime != null ? _submit : null,
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../data/models/dashboard_models.dart';
import '../../../data/models/follow_up_models.dart';
import '../../../data/repositories/dashboard_repository.dart';
import '../../../data/repositories/follow_ups_repository.dart';
import '../../../theme.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../tasks/widgets/add_task_date_picker_helper.dart';
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
  bool _isSubmitting = false;

  @override
  void dispose() {
    _whenController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final dashRepo = context.read<DashboardRepository>();
    final followUpRepo = context.read<FollowUpsRepository>();
    setState(() => _isSubmitting = true);
    final fc = FollowUpCall(id: widget.lead.id, tag: _selectedTag, name: 'Call back ${widget.lead.name}', time: _whenController.text);
    final f = FollowUp(
      id: DateTime.now().toString(), name: widget.lead.name, category: widget.lead.source, status: widget.lead.status,
      urgency: _selectedTag == FollowUpTag.priority ? FollowUpUrgency.dueToday : FollowUpUrgency.upcoming,
    );
    await dashRepo.addFollowUp(fc);
    await followUpRepo.addFollowUp(f);
    if (mounted) context.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(label: 'Lead Name', hintText: '', controller: TextEditingController(text: widget.lead.name)),
          AppSpacing.gapLg,
          GestureDetector(
            onTap: () async {
              final dt = await AddTaskDatePickerHelper.pickDateTime(context);
              if (dt != null && context.mounted) {
                setState(() { _selectedDateTime = dt; _whenController.text = AddTaskDatePickerHelper.format(dt); });
              }
            },
            child: AbsorbPointer(child: CustomTextField(label: 'When', hintText: 'Select date and time', controller: _whenController, isRequired: true)),
          ),
          AppSpacing.gapLg,
          FollowUpTagSelector(selectedTag: _selectedTag, onChanged: (tag) => setState(() => _selectedTag = tag)),
          AppSpacing.gapXxl,
          CustomButton(text: 'Create Follow-up', isLoading: _isSubmitting, onPressed: _selectedDateTime != null ? _submit : null),
        ],
      ),
    );
  }
}

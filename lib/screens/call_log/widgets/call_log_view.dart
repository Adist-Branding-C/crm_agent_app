import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/call_log/call_log_bloc.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../data/models/activity_models.dart';
import '../../../widgets/screen_header.dart';
import '../models/call_log_form_state.dart';
import 'call_log_body.dart';
import 'save_button.dart';

class CallLogView extends StatelessWidget {
  final Lead lead;
  final EnquiryActivity? activity;
  final CallLogFormState formState;
  final ValueChanged<String> onCallStatusChanged;
  final ValueChanged<LeadStatus> onLeadStatusChanged;
  final ValueChanged<LeadPurpose> onPurposeChanged;
  final TextEditingController remarkController;

  const CallLogView({
    super.key,
    required this.lead,
    this.activity,
    required this.formState,
    required this.onCallStatusChanged,
    required this.onLeadStatusChanged,
    required this.onPurposeChanged,
    required this.remarkController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CallLogBloc, CallLogState>(
      listener: (context, state) {
        if (state is CallLogSaveSuccess) {
          context.read<CallLogBloc>().add(const ResetCallLog());
          context.pop();
        }
      },
      child: Column(
        children: [
          ScreenHeader(
            title: activity != null ? 'Edit Call Log' : 'Log Call',
            subtitle: lead.name,
          ),
          Expanded(
            child: CallLogBody(
              lead: lead,
              formState: formState,
              onCallStatusChanged: onCallStatusChanged,
              onLeadStatusChanged: onLeadStatusChanged,
              onPurposeChanged: onPurposeChanged,
              remarkController: remarkController,
              saveButton: BlocBuilder<CallLogBloc, CallLogState>(
                buildWhen: (prev, curr) => curr is CallLogSaving,
                builder: (context, state) => SaveButton(
                  isLoading: state is CallLogSaving,
                  onTap: () => context.read<CallLogBloc>().add(
                    SaveCallLog(
                      lead: lead,
                      callStatus: formState.callStatus,
                      leadStatus: formState.leadStatus,
                      purpose: formState.purpose,
                      remark: remarkController.text,
                      activityId: activity?.id,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

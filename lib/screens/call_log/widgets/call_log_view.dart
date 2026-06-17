import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/call_log/call_log_bloc.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../widgets/screen_header.dart';
import 'call_log_body.dart';
import 'save_button.dart';

/// The presentational view layer of the Call Log screen.
class CallLogView extends StatelessWidget {
  final Lead lead;
  final String callStatus;
  final ValueChanged<String> onCallStatusChanged;
  final LeadStatus leadStatus;
  final ValueChanged<LeadStatus> onLeadStatusChanged;
  final LeadPurpose purpose;
  final ValueChanged<LeadPurpose> onPurposeChanged;
  final TextEditingController remarkController;

  const CallLogView({
    super.key,
    required this.lead,
    required this.callStatus,
    required this.onCallStatusChanged,
    required this.leadStatus,
    required this.onLeadStatusChanged,
    required this.purpose,
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
          ScreenHeader(title: 'Log Call', subtitle: lead.name),
          Expanded(
            child: CallLogBody(
              lead: lead,
              callStatus: callStatus,
              onCallStatusChanged: onCallStatusChanged,
              leadStatus: leadStatus,
              onLeadStatusChanged: onLeadStatusChanged,
              purpose: purpose,
              onPurposeChanged: onPurposeChanged,
              remarkController: remarkController,
              saveButton: BlocBuilder<CallLogBloc, CallLogState>(
                builder: (context, state) => SaveButton(
                  isLoading: state is CallLogSaving,
                  onTap: () => context.read<CallLogBloc>().add(
                        SaveCallLog(
                          lead: lead,
                          callStatus: callStatus,
                          leadStatus: leadStatus,
                          purpose: purpose,
                          remark: remarkController.text,
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

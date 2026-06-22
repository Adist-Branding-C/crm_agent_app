import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../bloc/leads/leads_models.dart';
import '../models/call_log_form_state.dart';
import 'call_ended_banner.dart';
import 'purpose_selector.dart';
import 'quick_actions.dart';
import 'remark_field.dart';
import 'status_selector.dart';

class CallLogBody extends StatelessWidget {
  final Lead lead;
  final CallLogFormState formState;
  final ValueChanged<String> onCallStatusChanged;
  final ValueChanged<LeadStatus> onLeadStatusChanged;
  final ValueChanged<LeadPurpose> onPurposeChanged;
  final TextEditingController remarkController;
  final Widget saveButton;

  const CallLogBody({
    super.key,
    required this.lead,
    required this.formState,
    required this.onCallStatusChanged,
    required this.onLeadStatusChanged,
    required this.onPurposeChanged,
    required this.remarkController,
    required this.saveButton,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const QuickActions(),
        const CallEndedBanner(),
        StatusSelector(
          selectedCallStatus: formState.callStatus,
          onCallStatusChanged: onCallStatusChanged,
          selectedLeadStatus: formState.leadStatus,
          onLeadStatusChanged: onLeadStatusChanged,
        ),
        PurposeSelector(
          selectedPurpose: formState.purpose,
          onPurposeChanged: onPurposeChanged,
        ),
        RemarkField(controller: remarkController),
        saveButton,
      ],
    );
  }
}

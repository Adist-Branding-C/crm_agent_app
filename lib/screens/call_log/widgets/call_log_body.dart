import 'package:flutter/material.dart';
import '../../../bloc/leads/leads_enums.dart';
import '../../../bloc/leads/leads_models.dart';
import 'call_ended_banner.dart';
import 'purpose_selector.dart';
import 'quick_actions.dart';
import 'remark_field.dart';
import 'status_selector.dart';

class CallLogBody extends StatelessWidget {
  final Lead lead;
  final String callStatus;
  final ValueChanged<String> onCallStatusChanged;
  final LeadStatus leadStatus;
  final ValueChanged<LeadStatus> onLeadStatusChanged;
  final LeadPurpose purpose;
  final ValueChanged<LeadPurpose> onPurposeChanged;
  final TextEditingController remarkController;
  final Widget saveButton;

  const CallLogBody({
    super.key,
    required this.lead,
    required this.callStatus,
    required this.onCallStatusChanged,
    required this.leadStatus,
    required this.onLeadStatusChanged,
    required this.purpose,
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
          selectedCallStatus: callStatus,
          onCallStatusChanged: onCallStatusChanged,
          selectedLeadStatus: leadStatus,
          onLeadStatusChanged: onLeadStatusChanged,
        ),
        PurposeSelector(
          selectedPurpose: purpose,
          onPurposeChanged: onPurposeChanged,
        ),
        RemarkField(controller: remarkController),
        saveButton,
      ],
    );
  }
}

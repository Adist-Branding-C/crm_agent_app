import 'package:flutter/material.dart';
import '../../bloc/leads/leads_enums.dart';
import '../../bloc/leads/leads_models.dart';
import '../../theme.dart';
import 'models/call_log_form_state.dart';
import 'widgets/call_log_view.dart';

class CallLogScreen extends StatefulWidget {
  final Lead? lead;
  const CallLogScreen({super.key, this.lead});

  @override
  State<CallLogScreen> createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {
  final _remarkController = TextEditingController();
  late CallLogFormState _formState;

  @override
  void initState() {
    super.initState();
    _formState = CallLogFormState(
      leadStatus: widget.lead?.status ?? LeadStatus.interested,
      purpose: widget.lead?.source ?? LeadPurpose.newAdmission,
    );
  }

  @override
  void dispose() {
    _remarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lead = widget.lead ??
        const Lead(
          name: 'Unknown Lead', phone: '',
          status: LeadStatus.newStatus, source: LeadPurpose.enquiry,
          category: LeadCategory.cold, location: '',
        );

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: CallLogView(
          lead: lead,
          formState: _formState,
          onCallStatusChanged: (val) => setState(() => _formState = _formState.copyWith(callStatus: val)),
          onLeadStatusChanged: (val) => setState(() => _formState = _formState.copyWith(leadStatus: val)),
          onPurposeChanged: (val) => setState(() => _formState = _formState.copyWith(purpose: val)),
          remarkController: _remarkController,
        ),
      ),
    );
  }
}

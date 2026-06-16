import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/call_log/call_log_bloc.dart';
import '../../bloc/leads/leads_enums.dart';
import '../../bloc/leads/leads_models.dart';
import '../../theme.dart';
import '../../widgets/screen_header.dart';
import 'widgets/call_log_body.dart';
import 'widgets/save_button.dart';

class CallLogScreen extends StatefulWidget {
  final Lead? lead;
  const CallLogScreen({super.key, this.lead});

  @override
  State<CallLogScreen> createState() => _CallLogScreenState();
}

class _CallLogScreenState extends State<CallLogScreen> {
  late String _callStatus = 'Connected';
  late LeadStatus _leadStatus = widget.lead?.status ?? LeadStatus.interested;
  late LeadPurpose _purpose = widget.lead?.source ?? LeadPurpose.newAdmission;
  final _remarkController = TextEditingController();

  @override
  void dispose() {
    _remarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lead = widget.lead ??
        const Lead(
          name: 'Unknown Lead',
          phone: '',
          status: LeadStatus.newStatus,
          source: LeadPurpose.enquiry,
          category: LeadCategory.cold,
          location: '',
        );

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: BlocListener<CallLogBloc, CallLogState>(
          listener: (context, state) {
            if (state is CallLogSaveSuccess) context.pop();
          },
          child: Column(
            children: [
              ScreenHeader(title: 'Log Call', subtitle: lead.name),
              Expanded(
                child: CallLogBody(
                  lead: lead,
                  callStatus: _callStatus,
                  onCallStatusChanged: (val) => setState(() => _callStatus = val),
                  leadStatus: _leadStatus,
                  onLeadStatusChanged: (val) => setState(() => _leadStatus = val),
                  purpose: _purpose,
                  onPurposeChanged: (val) => setState(() => _purpose = val),
                  remarkController: _remarkController,
                  saveButton: BlocBuilder<CallLogBloc, CallLogState>(
                    builder: (context, state) => SaveButton(
                      isLoading: state is CallLogSaving,
                      onTap: () => context.read<CallLogBloc>().add(
                            SaveCallLog(
                              lead: lead,
                              callStatus: _callStatus,
                              leadStatus: _leadStatus,
                              purpose: _purpose,
                              remark: _remarkController.text,
                            ),
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

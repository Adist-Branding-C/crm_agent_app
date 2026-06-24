import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/leads/leads_models.dart';
import '../../data/models/activity_models.dart';
import '../../data/repositories/activity_repository.dart';
import '../../router/app_routes.dart';
import '../../theme.dart';
import '../../widgets/screen_header.dart';
import 'widgets/add_follow_up_bottom_sheet.dart';
import 'widgets/view_call_log_body.dart';
import 'widgets/view_call_log_buttons.dart';
import 'widgets/invalid_call_log_fallback.dart';

part 'widgets/view_call_log_actions.dart';

class ViewCallLogScreen extends StatefulWidget {
  final Lead? lead;
  final EnquiryActivity? activity;
  const ViewCallLogScreen({super.key, this.lead, this.activity});

  @override
  State<ViewCallLogScreen> createState() => _ViewCallLogScreenState();
}

class _ViewCallLogScreenState extends State<ViewCallLogScreen> {
  late EnquiryActivity _activity;

  @override
  void initState() {
    super.initState();
    _activity = widget.activity!;
  }

  void refreshState(EnquiryActivity match) {
    setState(() => _activity = match);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.lead == null || widget.activity == null) {
      return const InvalidCallLogFallback();
    }
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const ScreenHeader(title: 'View Call Log'),
            Expanded(child: ViewCallLogBody(lead: widget.lead!, activity: _activity)),
            ViewCallLogButtons(
              onEditTap: () => _editCallLog(context),
              onCreateFollowUpTap: () => _createFollowUp(context),
            ),
          ],
        ),
      ),
    );
  }
}

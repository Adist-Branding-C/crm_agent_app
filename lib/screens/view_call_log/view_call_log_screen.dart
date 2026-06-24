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

  void _refresh() {
    final repo = context.read<ActivityRepository>();
    final list = repo.getActivitiesForLead(widget.lead!.id);
    final match = list.where((a) => a.id == _activity.id).firstOrNull;
    if (match != null) refreshState(match);
  }

  Future<void> _editCallLog() async {
    await context.pushNamed(
      AppRoutes.callLog,
      extra: {'lead': widget.lead, 'activity': _activity},
    );
    if (!context.mounted) return;
    _refresh();
  }

  Future<void> _createFollowUp() async {
    final success = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddFollowUpBottomSheet(lead: widget.lead!),
    );
    if (success == true && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Follow-up call scheduled for ${widget.lead!.name}'),
        ),
      );
    }
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
            Expanded(
              child: ViewCallLogBody(lead: widget.lead!, activity: _activity),
            ),
            ViewCallLogButtons(
              onEditTap: _editCallLog,
              onCreateFollowUpTap: _createFollowUp,
            ),
          ],
        ),
      ),
    );
  }
}

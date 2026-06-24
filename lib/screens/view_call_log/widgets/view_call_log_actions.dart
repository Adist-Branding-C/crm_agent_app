part of '../view_call_log_screen.dart';

extension _ViewCallLogScreenActions on _ViewCallLogScreenState {
  void _refresh() {
    final repo = context.read<ActivityRepository>();
    final list = repo.getActivitiesForLead(widget.lead!.id);
    final match = list.where((a) => a.id == _activity.id).firstOrNull;
    if (match != null) refreshState(match);
  }

  Future<void> _editCallLog(BuildContext context) async {
    await context.pushNamed(
      AppRoutes.callLog,
      extra: {'lead': widget.lead, 'activity': _activity},
    );
    if (!context.mounted) return;
    _refresh();
  }

  Future<void> _createFollowUp(BuildContext context) async {
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
}

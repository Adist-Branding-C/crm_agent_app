import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../data/models/activity_models.dart';
import '../call_log_screen.dart';

class CallLogRouteProvider extends StatelessWidget {
  final GoRouterState state;

  const CallLogRouteProvider({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final extra = state.extra;
    if (extra is Lead) {
      return CallLogScreen(lead: extra);
    } else if (extra is Map<String, dynamic>) {
      final lead = extra['lead'] as Lead?;
      final activity = extra['activity'] as EnquiryActivity?;
      return CallLogScreen(lead: lead, activity: activity);
    }
    return const CallLogScreen();
  }
}

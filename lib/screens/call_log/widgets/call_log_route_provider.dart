import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/leads/leads_models.dart';
import '../call_log_screen.dart';

class CallLogRouteProvider extends StatelessWidget {
  final GoRouterState state;

  const CallLogRouteProvider({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final extra = state.extra;
    final lead = extra is Lead ? extra : null;
    return CallLogScreen(lead: lead);
  }
}

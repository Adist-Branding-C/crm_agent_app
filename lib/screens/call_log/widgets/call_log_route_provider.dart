import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/leads/leads_models.dart';
import '../call_log_screen.dart';

/// Resolves the routing argument for the Call Log screen.
class CallLogRouteProvider extends StatelessWidget {
  final GoRouterState state;

  const CallLogRouteProvider({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final lead = state.extra as Lead?;
    return CallLogScreen(lead: lead);
  }
}

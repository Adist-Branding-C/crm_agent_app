import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../data/repositories/leads_repository.dart';
import '../call_log_screen.dart';

/// Resolves the routing argument or loads a lead via enquiryId from query parameters.
class CallLogRouteProvider extends StatelessWidget {
  /// The GoRouter state containing routing parameters.
  final GoRouterState state;

  /// Creates a [CallLogRouteProvider].
  const CallLogRouteProvider({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final lead = state.extra as Lead?;
    if (lead != null) {
      return CallLogScreen(lead: lead);
    }

    final enquiryId = state.uri.queryParameters['enquiryId'];
    if (enquiryId != null && enquiryId.isNotEmpty) {
      return FutureBuilder<Lead?>(
        future: context.read<LeadsRepository>().getLeadById(enquiryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return CallLogScreen(lead: snapshot.data);
        },
      );
    }

    return const CallLogScreen();
  }
}

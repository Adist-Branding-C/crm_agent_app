import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../bloc/leads/leads_models.dart';
import '../../../data/models/activity_models.dart';
import '../call_log_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/call_log/call_log_bloc.dart';
import '../../../utils/phone_dialer_service.dart';

class CallLogRouteProvider extends StatelessWidget {
  final GoRouterState state;

  const CallLogRouteProvider({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final extra = state.extra;
    Lead? lead;
    EnquiryActivity? activity;

    if (extra is Lead) {
      lead = extra;
    } else if (extra is Map<String, dynamic>) {
      lead = extra['lead'] as Lead?;
      activity = extra['activity'] as EnquiryActivity?;
    }

    return BlocProvider<CallLogBloc>(
      create: (c) => CallLogBloc(
        leadsRepository: c.read(),
        activityRepository: c.read(),
        dialerService: const PhoneDialerService(),
      ),
      child: CallLogScreen(lead: lead, activity: activity),
    );
  }
}

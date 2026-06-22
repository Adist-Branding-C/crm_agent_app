import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/call_log/call_log_bloc.dart';
import '../router/app_routes.dart';
import '../router/navigator_key.dart';
import 'call_actions_bottom_sheet.dart';

class CallLogNavigationHandler extends StatelessWidget {
  final Widget child;

  const CallLogNavigationHandler({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CallLogBloc, CallLogState>(
      listener: (context, state) {
        if (state is CallLogBottomSheetTriggered) {
          CallActionsBottomSheet.show(
            rootNavigatorKey.currentContext ?? context,
            lead: state.lead,
          );
          context.read<CallLogBloc>().add(const ResetCallLog());
        }
        if (state is CallLogNavigationPending) {
          final navContext = rootNavigatorKey.currentContext ?? context;
          navContext.pushNamed(AppRoutes.callLog, extra: state.lead);
          context.read<CallLogBloc>().add(const ResetCallLog());
        }
      },
      child: child,
    );
  }
}

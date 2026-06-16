import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/call_log/call_log_bloc.dart';
import '../theme.dart';

class CallLifecycleObserver extends StatefulWidget {
  final Widget child;
  const CallLifecycleObserver({super.key, required this.child});

  @override
  State<CallLifecycleObserver> createState() => _CallLifecycleObserverState();
}

class _CallLifecycleObserverState extends State<CallLifecycleObserver>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<CallLogBloc>().add(const AppReturnedFromCall());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CallLogBloc, CallLogState>(
      listener: (context, state) {
        if (state is CallInProgress) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Calling ${state.lead.name}...'),
              backgroundColor: AppColors.primaryColor,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      child: widget.child,
    );
  }
}

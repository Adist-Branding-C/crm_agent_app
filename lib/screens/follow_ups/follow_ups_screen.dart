import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/follow_ups/follow_ups_bloc.dart';
import '../../bloc/follow_ups/follow_ups_models.dart';
import '../../theme.dart';
import '../../widgets/async_state_view.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/follow_up_header.dart';
import 'widgets/follow_up_list_body.dart';

/// Screen listing all categorised follow-up calls.
class FollowUpsScreen extends StatelessWidget {
  /// Creates a constant [FollowUpsScreen].
  const FollowUpsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FollowUpsBloc()..add(const LoadFollowUps()),
      child: PageScaffold(
        padding: EdgeInsets.zero,
        child: BlocListener<FollowUpsBloc, FollowUpsState>(
          listener: (context, state) {
            if (state is FollowUpsLoaded && state.callingName != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Calling ${state.callingName}...'),
                  backgroundColor: AppColors.primaryColor,
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          },
          child: Column(
            children: const [
              FollowUpHeader(),
              Expanded(child: _FollowUpsBody()),
            ],
          ),
        ),
      ),
    );
  }
}

class _FollowUpsBody extends StatelessWidget {
  const _FollowUpsBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowUpsBloc, FollowUpsState>(
      builder: (context, state) {
        final followUps =
            state is FollowUpsLoaded ? state.followUps : const <FollowUp>[];

        return AsyncStateView(
          isLoading: state is FollowUpsLoading || state is FollowUpsInitial,
          hasError: state is FollowUpsError,
          errorMessage: state is FollowUpsError ? state.errorMessage : 'Error',
          onRetry: () =>
              context.read<FollowUpsBloc>().add(const LoadFollowUps()),
          child: FollowUpListBody(calls: followUps),
        );
      },
    );
  }
}

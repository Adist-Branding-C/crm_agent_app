import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/follow_ups/follow_ups_bloc.dart';
import '../../bloc/follow_ups/follow_ups_models.dart';
import '../../bloc/call_log/call_log_bloc.dart';
import '../../data/repositories/follow_ups_repository.dart';
import '../../widgets/async_state_view.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/follow_up_header.dart';
import 'widgets/follow_up_list_body.dart';
String _followUpsErrorString(FollowUpsFailure f) {
  switch (f) {
    case FollowUpsFailure.load:
      return 'Failed to load follow-ups';
    case FollowUpsFailure.unknown:
      return 'An error occurred';
  }
}

/// Screen listing all categorised follow-up calls.
class FollowUpsScreen extends StatelessWidget {
  /// Creates a constant [FollowUpsScreen].
  const FollowUpsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FollowUpsBloc(
        followUpsRepository: context.read<FollowUpsRepository>(),
      )..add(const LoadFollowUps()),
      child: PageScaffold(
        padding: EdgeInsets.zero,
        child: MultiBlocListener(
          listeners: [
            BlocListener<CallLogBloc, CallLogState>(
              listener: (context, state) {
                if (state is CallLogSaveSuccess) {
                  context.read<FollowUpsBloc>().add(const LoadFollowUps());
                }
              },
            ),
          ],
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
        final followUps = state is FollowUpsLoaded
            ? state.followUps
            : const <FollowUp>[];

        return AsyncStateView(
          isLoading: state is FollowUpsLoading || state is FollowUpsInitial,
          hasError: state is FollowUpsError,
          errorMessage: state is FollowUpsError
              ? _followUpsErrorString(state.failure)
              : 'Error',
          onRetry: () =>
              context.read<FollowUpsBloc>().add(const LoadFollowUps()),
          child: FollowUpListBody(calls: followUps),
        );
      },
    );
  }
}

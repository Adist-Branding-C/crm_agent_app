import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/deals/deals_bloc.dart';
import '../../../widgets/async_state_view.dart';
import 'deals_header.dart';
import 'deals_stats.dart';

String _dealsErrorString(DealsFailure f) {
  switch (f) {
    case DealsFailure.load: return 'Failed to fetch deals';
    case DealsFailure.unknown: return 'An error occurred';
  }
}

/// Handles async loading/error for the deals header and stats section.
class DealsAsyncHandler extends StatelessWidget {
  const DealsAsyncHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsBloc, DealsState>(
      buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
      builder: (context, state) {
        final isLoading = state is DealsLoading || state is DealsInitial;
        return AsyncStateView(
          isLoading: isLoading,
          hasError: state is DealsError,
          errorMessage: state is DealsError ? _dealsErrorString(state.failure) : 'Error',
          onRetry: () => context.read<DealsBloc>().add(const LoadDeals()),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [DealsHeader(), DealsStats()],
          ),
        );
      },
    );
  }
}

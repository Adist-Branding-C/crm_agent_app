import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/deals/deals_bloc.dart';
import '../../../widgets/async_state_view.dart';
import 'deals_header.dart';
import 'deals_stats.dart';

/// Handles async loading/error for the deals header and stats section.
class DealsAsyncHandler extends StatelessWidget {
  const DealsAsyncHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsBloc, DealsState>(
      builder: (context, state) {
        final isLoading = state is DealsLoading || state is DealsInitial;
        return AsyncStateView(
          isLoading: isLoading,
          hasError: state is DealsError,
          errorMessage: state is DealsError ? state.errorMessage : 'Error',
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/deals/deals_bloc.dart';
import '../../bloc/deals/deals_models.dart';
import '../../data/repositories/deals_repository.dart';
import '../../widgets/async_state_view.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/deals_content.dart';

/// The main Deals Screen.
class DealsScreen extends StatefulWidget {
  /// Creates a constant [DealsScreen] widget.
  const DealsScreen({super.key});

  @override
  State<DealsScreen> createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> {
  int _viewIndex = 0; // 0 for Pipeline, 1 for List

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DealsBloc(
        dealsRepository: context.read<DealsRepository>(),
      )..add(const LoadDeals()),
      child: PageScaffold(
        padding: EdgeInsets.zero,
        child: BlocBuilder<DealsBloc, DealsState>(
          builder: (context, state) {
            final deals = state is DealsLoaded ? state.deals : const <Deal>[];

            return AsyncStateView(
              isLoading: state is DealsLoading || state is DealsInitial,
              hasError: state is DealsError,
              errorMessage: state is DealsError ? state.errorMessage : 'Error',
              onRetry: () => context.read<DealsBloc>().add(const LoadDeals()),
              child: DealsLoadedContent(
                deals: deals,
                viewIndex: _viewIndex,
                onToggle: (value) => setState(() => _viewIndex = value),
              ),
            );
          },
        ),
      ),
    );
  }
}

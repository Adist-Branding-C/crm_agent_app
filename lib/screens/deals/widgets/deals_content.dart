import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/deals/deals_bloc.dart';
import '../../../bloc/deals/deals_models.dart';
import '../models/deals_view_notifier.dart';
import 'deals_pipeline_view.dart';
import 'deals_list_view.dart';

/// Renders the pipeline or list view based on the current toggle state.
class DealsContent extends StatelessWidget {
  const DealsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsBloc, DealsState>(
      buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType || (curr is DealsLoaded && (prev as DealsLoaded?)?.deals != curr.deals),
      builder: (context, state) {
        final deals = state is DealsLoaded ? state.deals : const <Deal>[];
        final viewIndex = context.watch<DealsViewNotifier>().value;
        return viewIndex == 0
            ? DealsPipelineView(deals: deals)
            : DealsListView(deals: deals);
      },
    );
  }
}

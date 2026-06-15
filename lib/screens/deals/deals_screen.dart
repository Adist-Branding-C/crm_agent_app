import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/deals/deals_bloc.dart';
import '../../theme.dart';
import 'widgets/deals_header.dart';
import 'widgets/deals_list_view.dart';
import 'widgets/deals_pipeline_view.dart';
import 'widgets/deals_stats.dart';
import 'widgets/deals_toggle.dart';

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
      create: (context) => DealsBloc()..add(const LoadDeals()),
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: SafeArea(
          child: BlocBuilder<DealsBloc, DealsState>(
            builder: (context, state) {
              if (state is DealsLoading || state is DealsInitial) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
              if (state is DealsLoaded) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DealsHeader(),
                      const DealsStats(),
                      DealsToggle(
                        selectedIndex: _viewIndex,
                        onChanged: (val) => setState(() => _viewIndex = val),
                      ),
                      const SizedBox(height: 8),
                      _viewIndex == 0
                          ? DealsPipelineView(deals: state.deals)
                          : DealsListView(deals: state.deals),
                      const SizedBox(height: 24),
                    ],
                  ),
                );
              }
              final msg = state is DealsError ? state.errorMessage : 'Error';
              return Center(
                child: Text(
                  msg,
                  style: const TextStyle(color: AppColors.errorColor),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

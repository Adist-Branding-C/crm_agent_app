import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/deals/deals_bloc.dart';
import '../../../../theme.dart';
import '../../../../utils/currency_formatter.dart';
import 'deals_stats_card.dart';

/// Renders the statistics cards at the top of the Deals screen.
class DealsStats extends StatelessWidget {
  /// Creates a constant [DealsStats].
  const DealsStats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealsBloc, DealsState>(
      builder: (context, state) {
        final pipelineVal = state is DealsLoaded
            ? state.totalPipelineValue
            : 0.0;
        final wonVal = state is DealsLoaded ? state.wonValue : 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: DealsStatsCard(
                  title: 'Pipeline value',
                  value: pipelineVal.toRupeeFormat(),
                  backgroundColor: AppColors.textDark,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DealsStatsCard(
                  title: 'Won this month',
                  value: wonVal.toRupeeFormat(),
                  backgroundColor: const Color(0xFF10B981),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

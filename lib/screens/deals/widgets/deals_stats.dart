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
    final pipelineVal = context.select((DealsBloc b) {
      final s = b.state;
      return s is DealsLoaded ? s.totalPipelineValue : 0.0;
    });

    final wonVal = context.select((DealsBloc b) {
      final s = b.state;
      return s is DealsLoaded ? s.wonValue : 0.0;
    });

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.sm),
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
              backgroundColor: AppColors.success,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/deals/deals_bloc.dart';
import '../../../../theme.dart';

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
                child: _buildCard(
                  title: 'Pipeline value',
                  value: _formatAmount(pipelineVal),
                  backgroundColor: AppColors.textDark,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildCard(
                  title: 'Won this month',
                  value: _formatAmount(wonVal),
                  backgroundColor: const Color(0xFF10B981),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCard({
    required String title,
    required String value,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.6),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _formatAmount(double amount) {
    if (amount >= 100000) {
      return '₹${(amount / 100000).toStringAsFixed(2)}L';
    }
    return '₹${(amount / 1000).toStringAsFixed(0)}K';
  }
}

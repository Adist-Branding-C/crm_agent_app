import 'package:flutter/material.dart';
import '../../../widgets/custom_card.dart';
import '../../../theme.dart';
import '../../../bloc/account/account_models.dart';

/// Card showing statistics for the current month.
class MonthlyStats extends StatelessWidget {
  final AccountProfile profile;

  /// Creates a [MonthlyStats].
  const MonthlyStats({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
            child: Text(
              'This month',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textMuted,
                  ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  value: '${profile.wonDeals}',
                  label: 'Won deals',
                  valueColor: const Color(0xFF10B981),
                ),
              ),
              _buildDivider(),
              Expanded(
                child: _buildStatItem(
                  value: '${profile.myLeads}',
                  label: 'My leads',
                  valueColor: AppColors.textDark,
                ),
              ),
              _buildDivider(),
              Expanded(
                child: _buildStatItem(
                  value: '${(profile.conversionRate * 100).toInt()}%',
                  label: 'Conversion',
                  valueColor: const Color(0xFF6366F1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String value,
    required String label,
    required Color valueColor,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(height: 32, width: 1, color: AppColors.borderLight);
  }
}

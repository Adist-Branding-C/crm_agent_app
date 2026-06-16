import 'package:flutter/material.dart';
import '../../../widgets/custom_card.dart';
import '../../../theme.dart';
import '../../../bloc/account/account_models.dart';
import 'monthly_stat_item.dart';

/// Card showing statistics for the current month.
class MonthlyStats extends StatelessWidget {
  final AccountProfile profile;

  /// Creates a [MonthlyStats].
  const MonthlyStats({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    const divider = SizedBox(
      height: 32,
      width: 1,
      child: ColoredBox(color: AppColors.borderLight),
    );

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
                child: MonthlyStatItem(
                  value: '${profile.wonDeals}',
                  label: 'Won deals',
                  valueColor: AppColors.success,
                ),
              ),
              divider,
              Expanded(
                child: MonthlyStatItem(
                  value: '${profile.myLeads}',
                  label: 'My leads',
                  valueColor: AppColors.textDark,
                ),
              ),
              divider,
              Expanded(
                child: MonthlyStatItem(
                  value: '${(profile.conversionRate * 100).toInt()}%',
                  label: 'Conversion',
                  valueColor: AppColors.indigo,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

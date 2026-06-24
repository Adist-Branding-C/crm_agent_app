import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import '../../../../theme.dart';
import '../../../../utils/currency_formatter.dart';
import 'deal_stage_badge.dart';

/// The header displaying deal title and amount.
class DealCardHeader extends StatelessWidget {
  /// The deal model.
  final Deal deal;

  /// Creates a [DealCardHeader].
  const DealCardHeader({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '${deal.title} — ${deal.clientName}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          deal.amount.toRupeeFormat(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

/// The metadata row displaying close date and stage badge.
class DealCardMeta extends StatelessWidget {
  /// The deal model.
  final Deal deal;

  /// Creates a [DealCardMeta].
  const DealCardMeta({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              size: 13,
              color: AppColors.textMuted,
            ),
            AppSpacing.gapWXs,
            Text(
              deal.closeDate,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
        DealStageBadge(stage: deal.stage),
      ],
    );
  }
}

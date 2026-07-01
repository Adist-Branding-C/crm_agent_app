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
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: 13.s,
            ),
          ),
        ),
        AppSpacing.gapWMd,
        Text(
          deal.amount.toRupeeFormat(),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: AppColors.textDark,
            fontWeight: FontWeight.w800,
            fontSize: 13.s,
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
            Icon(
              Icons.calendar_today_outlined,
              size: 12.s,
              color: AppColors.textMuted,
            ),
            AppSpacing.gapWXs,
            Text(
              deal.closeDate,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.textMuted,
                fontSize: 11.s,
              ),
            ),
          ],
        ),
        DealStageBadge(stage: deal.stage),
      ],
    );
  }
}

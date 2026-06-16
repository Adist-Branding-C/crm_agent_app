import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import '../../../../theme/app_colors.dart';
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
            style: const TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        Text(
          deal.amount.toRupeeFormat(),
          style: const TextStyle(
            color: AppColors.textDark,
            fontWeight: FontWeight.w800,
            fontSize: 14,
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
            const SizedBox(width: 4),
            Text(
              deal.closeDate,
              style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 12,
              ),
            ),
          ],
        ),
        DealStageBadge(stage: deal.stage),
      ],
    );
  }
}

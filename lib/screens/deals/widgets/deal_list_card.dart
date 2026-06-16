import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import '../../../../widgets/custom_card.dart';
import '../../../../theme.dart';
import '../../../../utils/currency_formatter.dart';

/// Renders a Deal card tailored for the List view.
class DealListCard extends StatelessWidget {
  final Deal deal;

  /// Creates a constant [DealListCard].
  const DealListCard({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          ),
          const SizedBox(height: 8),
          Row(
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
              _buildStageBadge(),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: deal.stage.progress,
              color: deal.stage.color,
              backgroundColor: const Color(0xFFF1F5F9),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStageBadge() {
    final Color baseColor = deal.stage.color;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: baseColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        deal.stage.label,
        style: TextStyle(
          color: baseColor,
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }
}

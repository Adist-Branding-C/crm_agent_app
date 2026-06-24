import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import '../../../../theme.dart';
import '../../../../widgets/custom_card.dart';
import 'deal_list_card_helpers.dart';
import 'deals_presentation_extensions.dart';

/// Renders a Deal card tailored for the List view.
class DealListCard extends StatelessWidget {
  /// The deal model.
  final Deal deal;

  /// Creates a constant [DealListCard].
  const DealListCard({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.only(bottom: 16),
      padding: AppSpacing.cardPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DealCardHeader(deal: deal),
          const SizedBox(height: 8),
          DealCardMeta(deal: deal),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: deal.stage.progress,
              color: deal.stage.color,
              backgroundColor: AppColors.slate100,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}

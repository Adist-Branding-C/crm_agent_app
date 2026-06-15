import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import '../../../../widgets/custom_card.dart';
import '../../../../widgets/user_avatar.dart';
import '../../../../theme.dart';

/// Renders a Deal card tailored for the Pipeline view.
class DealPipelineCard extends StatelessWidget {
  final Deal deal;

  /// Creates a constant [DealPipelineCard].
  const DealPipelineCard({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.only(bottom: 12),
      borderRadius: 16,
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: deal.stage.color, width: 4)),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${deal.title} — ${deal.clientName}',
                      style: const TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      deal.formattedAmount,
                      style: const TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              UserAvatar(
                initials: deal.ownerInitials,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

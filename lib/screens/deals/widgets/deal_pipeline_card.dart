import 'package:flutter/material.dart';
import '../../../../bloc/deals/deals_models.dart';
import '../../../../widgets/custom_card.dart';
import '../../../../widgets/user_avatar.dart';
import '../../../../theme.dart';
import '../../../../utils/currency_formatter.dart';
import 'deals_presentation_extensions.dart';

/// Renders a Deal card tailored for the Pipeline view.
class DealPipelineCard extends StatelessWidget {
  final Deal deal;

  /// Creates a constant [DealPipelineCard].
  const DealPipelineCard({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: EdgeInsets.only(bottom: AppSpacing.md),
      
      borderRadius: 8.w,
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: deal.stage.color, width: 3.w)),
          ),
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${deal.title} — ${deal.clientName}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.s
                      ),
                    ),
                    AppSpacing.gapSm,
                    Text(
                      deal.amount.toRupeeFormat(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w800,
                        fontSize: 11.s
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

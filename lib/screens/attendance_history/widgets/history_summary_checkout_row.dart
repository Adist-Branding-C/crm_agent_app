import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Row widget rendering check-in state details and the Checkout CTA.
class HistorySummaryCheckoutRow extends StatelessWidget {
  /// Clock string when check-in occurred.
  final String? checkedInSince;

  /// Name of the location check-in was registered.
  final String checkInLocation;

  /// Creates a [HistorySummaryCheckoutRow].
  const HistorySummaryCheckoutRow({
    super.key,
    required this.checkedInSince,
    required this.checkInLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppSpacing.sm,
          height: AppSpacing.sm,
          decoration: const BoxDecoration(
            color: AppColors.success,
            shape: BoxShape.circle,
          ),
        ),
        AppSpacing.gapWSm,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Checked in · since ${checkedInSince ?? "--"}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$checkInLocation · GPS verified',
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: AppColors.slate400),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.slate600,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Check out',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

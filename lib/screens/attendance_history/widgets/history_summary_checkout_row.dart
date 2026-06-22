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
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: AppColors.success,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Checked in · since ${checkedInSince ?? "--"}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$checkInLocation · GPS verified',
                style: const TextStyle(color: AppColors.slate400, fontSize: 10),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.slate600,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            'Check out',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

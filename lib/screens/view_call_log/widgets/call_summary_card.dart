import 'package:flutter/material.dart';
import '../../../data/models/activity_models.dart';
import '../../../theme.dart';

class CallSummaryCard extends StatelessWidget {
  final EnquiryActivity activity;

  const CallSummaryCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.successBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.successLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.phone_outlined,
                  color: AppColors.success,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Call Summary',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildRow(context, 'Status: ', activity.callStatus ?? 'Connected', isGreen: true),
          const SizedBox(height: 8),
          _buildRow(context, 'Duration: ', activity.duration ?? '4:12 mins'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(color: AppColors.borderLight, height: 1),
          ),
          _buildRow(context, 'Date: ', activity.date ?? 'Today, 22 June 2026'),
          const SizedBox(height: 8),
          _buildRow(context, 'Time: ', activity.timeOfDay ?? '9:30 AM'),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, String label, String value, {bool isGreen = false}) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textDark,
            ),
        children: [
          TextSpan(text: label),
          TextSpan(
            text: value,
            style: TextStyle(
              color: isGreen ? AppColors.success : AppColors.textDark,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

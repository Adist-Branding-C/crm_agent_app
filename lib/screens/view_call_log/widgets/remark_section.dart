import 'package:flutter/material.dart';
import '../../../data/models/activity_models.dart';
import '../../../theme.dart';

class RemarkSection extends StatelessWidget {
  final EnquiryActivity activity;

  const RemarkSection({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    final remarkText = activity.remark ?? 'No remark was provided for this call.';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Remark',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderLight),
          ),
          child: Text(
            remarkText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textDark,
                  height: 1.4,
                ),
          ),
        ),
      ],
    );
  }
}

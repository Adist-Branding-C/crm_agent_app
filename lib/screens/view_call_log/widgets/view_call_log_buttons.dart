import 'package:flutter/material.dart';
import '../../../theme.dart';

class ViewCallLogButtons extends StatelessWidget {
  final VoidCallback onEditTap;
  final VoidCallback onCreateFollowUpTap;

  const ViewCallLogButtons({
    super.key,
    required this.onEditTap,
    required this.onCreateFollowUpTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.lg,
      ),
      child: Row(
        children: [
          Expanded(
            child: Material(
              color: AppColors.slate100,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: onEditTap,
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Edit Log',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.slate600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Material(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: onCreateFollowUpTap,
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Create Follow-up',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

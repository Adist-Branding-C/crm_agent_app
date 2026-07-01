import 'package:flutter/material.dart';
import '../../../theme.dart';

class MyActivityLeadSelector extends StatelessWidget {
  final String selectedLead;
  final VoidCallback onTap;

  const MyActivityLeadSelector({
    super.key,
    required this.selectedLead,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(6.w),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              border: Border.all(color: AppColors.borderLight),
            ),
            child: Row(
              children: [
                 Icon(
                  Icons.person_outline_rounded,
                  size: 20.s,
                  color: AppColors.textMuted,
                ),
                AppSpacing.gapWMd,
                Expanded(
                  child: Text(
                    selectedLead,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                ),
                 Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.textMuted,
                  size: 20.s,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

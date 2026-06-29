import 'package:flutter/material.dart';
import '../../../theme.dart';

class SettingsDisclaimer extends StatelessWidget {
  const SettingsDisclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 4.0.w),
      child: Row(
        children: [
          Icon(Icons.info_outline_rounded, size: 14.s, color: AppColors.textMuted),
          AppSpacing.gapWSm,
          Expanded(
            child: Text(
              'Changes apply instantly across the whole app and are saved on this device.',
              style: TextStyle(color: AppColors.textMuted, fontSize: 11.s, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}

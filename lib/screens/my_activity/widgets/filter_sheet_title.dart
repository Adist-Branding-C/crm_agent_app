import 'package:flutter/material.dart';
import '../../../theme.dart';

class FilterSheetTitle extends StatelessWidget {
  const FilterSheetTitle({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
    child: Text('Filter by lead', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textDark)),
  );
}

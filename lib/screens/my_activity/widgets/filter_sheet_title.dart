import 'package:flutter/material.dart';
import '../../../theme.dart';

class FilterSheetTitle extends StatelessWidget {
  const FilterSheetTitle({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Text('Filter by lead', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textDark)),
  );
}

import 'package:flutter/material.dart';
import '../../../theme.dart';

class FilterSheetAllLeadsRow extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const FilterSheetAllLeadsRow({super.key, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) => Column(children: [
    ListTile(
      onTap: onTap,
      leading: const Icon(Icons.people_outline_rounded, size: 22, color: AppColors.textMuted),
      title: const Text('All leads', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textDark)),
      trailing: isSelected ? const Icon(Icons.check_rounded, color: AppColors.primaryColor, size: 18) : null,
    ),
    const Divider(height: 1, color: AppColors.borderLight),
  ]);
}

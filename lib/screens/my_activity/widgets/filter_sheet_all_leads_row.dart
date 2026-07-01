import 'package:flutter/material.dart';
import '../../../theme.dart';

class FilterSheetAllLeadsRow extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const FilterSheetAllLeadsRow({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      ListTile(
        onTap: onTap,
        leading: Icon(
          Icons.people_outline_rounded,
          size: 22.s,
          color: AppColors.textMuted,
        ),
        title: Text(
          'All leads',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textDark,
          ),
        ),
        trailing: isSelected
            ? Icon(
                Icons.check_rounded,
                color: AppColors.primaryColor,
                size: 18.s,
              )
            : null,
      ),
      const Divider(height: 1, color: AppColors.borderLight),
    ],
  );
}

import 'package:flutter/material.dart';
import '../../../theme.dart';

class FilterSheetHeaderRow extends StatelessWidget {
  final bool hasActiveFilters;
  final VoidCallback? onClear;

  const FilterSheetHeaderRow({
    super.key,
    required this.hasActiveFilters,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Filter & Sort',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        if (hasActiveFilters)
          TextButton(
            onPressed: onClear,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'Clear',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}

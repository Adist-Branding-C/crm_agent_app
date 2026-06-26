import 'package:flutter/material.dart';
import '../theme.dart';

class FilterChipOption {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
}

class FilterChipBar extends StatelessWidget {
  final List<FilterChipOption> options;

  const FilterChipBar({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding:  EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
      child: Row(
      
        children: options
            .map(
              (opt) => Padding(
                padding:  EdgeInsets.only(right: AppSpacing.sm+10.w),
                child: _FilterChip(option: opt),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final FilterChipOption option;

  const _FilterChip({required this.option});

  @override
  Widget build(BuildContext context) {
    final themeColor = option.isSelected
        ? AppColors.primaryColor
        : Colors.white;
    final textColor = option.isSelected ? Colors.white : AppColors.textMuted;
    final border = option.isSelected
        ? Border.all(color: AppColors.blackAlpha8, width: 1.w)
        : Border.all(color: AppColors.borderLight);

    return GestureDetector(
      onTap: option.onTap,
      child: Container(
        padding:  EdgeInsets.symmetric(
          horizontal: 9.0.w,
          vertical: 7.0.h,
        ),
        decoration: BoxDecoration(
          color: themeColor,
          borderRadius: BorderRadius.circular(40.r),
          border: border,
        ),
        child: Text(
          option.label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 12.s,
          ),
        ),
      ),
    );
  }
}

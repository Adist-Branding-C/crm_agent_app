import 'package:flutter/material.dart';
import '../../../theme.dart';

class FilterChipsSection<T> extends StatelessWidget {
  final String title;
  final List<T> options;
  final String Function(T) labelBuilder;
  final Set<T> selectedValues;
  final ValueChanged<T> onToggle;

  const FilterChipsSection({
    super.key,
    required this.title,
    required this.options,
    required this.labelBuilder,
    required this.selectedValues,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5.w,
              ),
        ),
        AppSpacing.gapSm,
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: options.map((option) {
            final isSelected = selectedValues.contains(option);
            return GestureDetector(
              onTap: () => onToggle(option),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: isSelected
                      ? null
                      : Border.all(color: AppColors.borderLight),
                ),
                child: Text(
                  labelBuilder(option),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isSelected ? Colors.white : AppColors.textMuted,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      ),
                ),
              ),
            );
          }).toList(),
        ),
         AppSpacing.gapSm,
      ],
    );
  }
}

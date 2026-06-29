import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../theme/app_text_theme.dart';

class TypefaceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String styleValue;
  final bool isSelected;
  final VoidCallback onTap;

  const TypefaceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.styleValue,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final customTheme = getCustomTextTheme(Theme.of(context).textTheme, styleValue);
    final titleStyle = customTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold,
      color: AppColors.textDark,
      fontSize: 16.s,
    );

    return Semantics(
      button: true,
      selected: isSelected,
      label: '$title Typeface Option',
      child: Container(
        margin: EdgeInsets.only(bottom: 12.0.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFEBEE).withValues(alpha: 0.2) : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? const Color(0xFFE53935) : AppColors.borderLight,
            width: isSelected ? 1.5.w : 1.w,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: titleStyle),
                      AppSpacing.gapXxs,
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                          fontSize: 12.s,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 22.w,
                  height: 22.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? const Color(0xFFE53935) : Colors.transparent,
                    border: Border.all(
                      color: isSelected ? const Color(0xFFE53935) : AppColors.borderLight,
                      width: 1.5.w,
                    ),
                  ),
                  child: isSelected
                      ? Icon(Icons.check, size: 14.s, color: Colors.white)
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../models/font_size_presets.dart';

class FontSizeStops extends StatelessWidget {
  final int safeIndex;

  const FontSizeStops({super.key, required this.safeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(FontSizePresets.sizes.length, (index) {
        final isSelected = index == safeIndex;
        final isPassed = index <= safeIndex;

        if (isSelected) {
          return Container(
            width: 16.w,
            height: 16.w,
            decoration: BoxDecoration(
              color: AppColors.settingsRed,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.settingsRed.withValues(alpha: 0.3),
                  blurRadius: 6.r,
                  spreadRadius: 2.w,
                ),
              ],
            ),
          );
        }

        return Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            color: isPassed ? AppColors.settingsRed : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: isPassed ? AppColors.settingsRed : AppColors.borderLight,
              width: 1.5.w,
            ),
          ),
        );
      }),
    );
  }
}

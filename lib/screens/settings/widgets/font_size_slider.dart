import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import '../models/font_size_presets.dart';
import 'font_size_track.dart';

/// Custom slider for choosing font size using a stop-scale track.
class FontSizeSlider extends StatelessWidget {
  final String selectedSize;
  final ValueChanged<String> onSelected;

  const FontSizeSlider({
    super.key,
    required this.selectedSize,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final selectedIndex = FontSizePresets.sizes.indexOf(selectedSize);
    final safeIndex = selectedIndex == -1 ? 3 : selectedIndex;

    return CustomCard(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
      color: Colors.white,
      border: Border.all(color: AppColors.borderLight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('A', style: TextStyle(fontSize: 12.s, fontWeight: FontWeight.w600, color: AppColors.textMuted)),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  child: FontSizeTrack(safeIndex: safeIndex, onSelected: onSelected),
                ),
              ),
              Text('A', style: TextStyle(fontSize: 20.s, fontWeight: FontWeight.bold, color: AppColors.textMuted)),
            ],
          ),
          AppSpacing.gapMd,
          const Divider(height: 1, color: AppColors.borderLight),
          AppSpacing.gapMd,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedSize == 'Default' ? 'Default' : selectedSize,
                style: TextStyle(fontSize: 15.s, fontWeight: FontWeight.bold, color: AppColors.textDark),
              ),
              Text(
                FontSizePresets.percentages[safeIndex],
                style: TextStyle(fontSize: 14.s, fontWeight: FontWeight.w600, color: AppColors.textMuted),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

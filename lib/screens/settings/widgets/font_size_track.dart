import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../models/font_size_presets.dart';
import 'font_size_stops.dart';

class FontSizeTrack extends StatelessWidget {
  final int safeIndex;
  final ValueChanged<String> onSelected;

  const FontSizeTrack({
    super.key,
    required this.safeIndex,
    required this.onSelected,
  });

  void _updateIndex(double x, double width, double stepWidth) {
    final index = (x / stepWidth).round().clamp(0, FontSizePresets.sizes.length - 1);
    onSelected(FontSizePresets.sizes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final stepWidth = width / (FontSizePresets.sizes.length - 1);

        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            final box = context.findRenderObject() as RenderBox;
            final x = box.globalToLocal(details.globalPosition).dx - 16.w - 12.w;
            _updateIndex(x.clamp(0.0, width), width, stepWidth);
          },
          onTapDown: (details) => _updateIndex(details.localPosition.dx, width, stepWidth),
          child: SizedBox(
            height: 32.h,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 3.h,
                  decoration: BoxDecoration(
                    color: AppColors.borderLight,
                    borderRadius: BorderRadius.circular(1.5.r),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: safeIndex / (FontSizePresets.sizes.length - 1),
                  child: Container(
                    height: 3.h,
                    decoration: BoxDecoration(
                      color: AppColors.settingsRed,
                      borderRadius: BorderRadius.circular(1.5.r),
                    ),
                  ),
                ),
                FontSizeStops(safeIndex: safeIndex),
              ],
            ),
          ),
        );
      },
    );
  }
}

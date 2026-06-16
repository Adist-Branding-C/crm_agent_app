import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'timeline_tile_config.dart';

/// Renders the circular activity icon and connecting timeline lines.
class TimelineTileMarker extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final TimelineTileConfig config;

  const TimelineTileMarker({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    const lineColor = AppColors.borderLight;
    return SizedBox(
      width: 48,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (!isLast)
            const Positioned(
              top: 16,
              bottom: 0,
              child: SizedBox(width: 1.5, child: DecoratedBox(decoration: BoxDecoration(color: lineColor))),
            ),
          if (!isFirst)
            const Positioned(
              top: 0,
              bottom: 16,
              child: SizedBox(width: 1.5, child: DecoratedBox(decoration: BoxDecoration(color: lineColor))),
            ),
          Positioned(
            top: 0,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: config.bgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(config.icon, color: config.iconColor, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}

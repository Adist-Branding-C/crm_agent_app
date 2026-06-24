import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/responsive_quad_grid.dart';
import 'stat_item.dart';

class StatsRow extends StatelessWidget {
  final int callsCount;
  final int visitsCount;
  final int notesCount;
  final double hoursCount;

  const StatsRow({
    super.key,
    required this.callsCount,
    required this.visitsCount,
    required this.notesCount,
    required this.hoursCount,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveQuadGrid(
      children: [
        StatItem(
          value: '$callsCount',
          label: 'Calls',
          icon: Icons.phone_outlined,
          iconColor: AppColors.success,
        ),
        StatItem(
          value: '$visitsCount',
          label: 'Visits',
          icon: Icons.alt_route_rounded,
          iconColor: AppColors.accent,
        ),
        StatItem(
          value: '$notesCount',
          label: 'Notes',
          icon: Icons.description_outlined,
          iconColor: AppColors.info,
        ),
        StatItem(
          value: '$hoursCount',
          label: 'Hours',
          icon: Icons.access_time_rounded,
          iconColor: AppColors.warning,
        ),
      ],
    );
  }
}

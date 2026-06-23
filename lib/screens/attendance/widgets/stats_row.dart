import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../utils/responsive_helper.dart';
import 'stat_item.dart';

/// Row of 4 status metrics for the Daily Activity screen.
class StatsRow extends StatelessWidget {
  final int callsCount;
  final int visitsCount;
  final int notesCount;
  final double hoursCount;

  /// Creates a constant [StatsRow].
  const StatsRow({
    super.key,
    required this.callsCount,
    required this.visitsCount,
    required this.notesCount,
    required this.hoursCount,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
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
    ];

    final isMobileSmall = ResponsiveHelper.isMobileSmall(context);
    if (isMobileSmall) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(child: items[0]),
              const SizedBox(width: 8),
              Expanded(child: items[1]),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: items[2]),
              const SizedBox(width: 8),
              Expanded(child: items[3]),
            ],
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(child: items[0]),
        const SizedBox(width: 8),
        Expanded(child: items[1]),
        const SizedBox(width: 8),
        Expanded(child: items[2]),
        const SizedBox(width: 8),
        Expanded(child: items[3]),
      ],
    );
  }
}

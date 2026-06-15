import 'package:flutter/material.dart';
import '../../../theme.dart';
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
    return Row(
      children: [
        Expanded(
          child: StatItem(
            value: '$callsCount',
            label: 'Calls',
            icon: Icons.phone_outlined,
            iconColor: AppColors.success,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: StatItem(
            value: '$visitsCount',
            label: 'Visits',
            icon: Icons.alt_route_rounded,
            iconColor: AppColors.accent,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: StatItem(
            value: '$notesCount',
            label: 'Notes',
            icon: Icons.description_outlined,
            iconColor: AppColors.info,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: StatItem(
            value: '$hoursCount',
            label: 'Hours',
            icon: Icons.access_time_rounded,
            iconColor: AppColors.warning,
          ),
        ),
      ],
    );
  }
}

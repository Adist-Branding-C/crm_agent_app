import 'package:flutter/material.dart';
import '../../../data/models/attendance_history_model.dart';
import '../../../theme.dart';
import '../../../utils/responsive_helper.dart';
import '../../../widgets/custom_card.dart';

/// Row element showing the monthly count metrics for statuses.
class HistoryStatsRow extends StatelessWidget {
  /// History summary data.
  final AttendanceHistoryModel history;

  /// Creates a [HistoryStatsRow].
  const HistoryStatsRow({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    final items = [
      _buildItem(context, '${history.presentDays}', 'Present', AppColors.success),
      _buildItem(context, '${history.lateCount}', 'Late', AppColors.warning),
      _buildItem(context, '${history.halfDayCount}', 'Half Day', AppColors.warningText),
      _buildItem(context, '${history.leaveCount}', 'Leave', AppColors.info),
    ];

    final isMobileSmall = ResponsiveHelper.isMobileSmall(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: isMobileSmall
          ? Column(
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
            )
          : Row(
              children: [
                Expanded(child: items[0]),
                const SizedBox(width: 8),
                Expanded(child: items[1]),
                const SizedBox(width: 8),
                Expanded(child: items[2]),
                const SizedBox(width: 8),
                Expanded(child: items[3]),
              ],
            ),
    );
  }

  Widget _buildItem(BuildContext context, String count, String label, Color color) {
    return CustomCard(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            count,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: color, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

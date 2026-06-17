import 'package:flutter/material.dart';
import '../../../widgets/metric_card.dart';

class AnalyticsStatsCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String value;
  final String label;

  const AnalyticsStatsCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return MetricCard(
      icon: icon,
      iconColor: iconColor,
      iconBgColor: iconBgColor,
      primaryText: value,
      secondaryText: label,
      layout: MetricCardLayout.vertical,
    );
  }
}

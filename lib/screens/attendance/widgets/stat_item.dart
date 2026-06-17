import 'package:flutter/material.dart';
import '../../../widgets/metric_card.dart';

class StatItem extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color iconColor;

  const StatItem({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return MetricCard(
      icon: icon,
      iconColor: iconColor,
      iconBgColor: iconColor.withValues(alpha: 0.15),
      primaryText: value,
      secondaryText: label,
      layout: MetricCardLayout.vertical,
    );
  }
}

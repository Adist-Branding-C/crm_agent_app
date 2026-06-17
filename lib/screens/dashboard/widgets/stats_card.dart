import 'package:flutter/material.dart';
import '../../../widgets/metric_card.dart';

class StatsCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const StatsCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MetricCard(
      icon: icon,
      iconColor: iconColor,
      iconBgColor: iconBgColor,
      primaryText: title,
      secondaryText: subtitle,
      layout: MetricCardLayout.horizontal,
      onTap: onTap,
    );
  }
}

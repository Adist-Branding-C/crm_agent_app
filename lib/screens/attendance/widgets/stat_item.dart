import 'package:flutter/material.dart';
import '../../../theme.dart';
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

  static Color _resolveBgColor(Color iconColor) {
    if (iconColor == AppColors.success) return AppColors.successAlpha15;
    if (iconColor == AppColors.accent) return AppColors.accentAlpha15;
    if (iconColor == AppColors.info) return AppColors.infoAlpha15;
    if (iconColor == AppColors.warning) return AppColors.warningAlpha15;
    return iconColor.withValues(alpha: 0.15);
  }

  @override
  Widget build(BuildContext context) {
    return MetricCard(
      icon: icon,
      iconColor: iconColor,
      iconBgColor: _resolveBgColor(iconColor),
      primaryText: value,
      secondaryText: label,
      layout: MetricCardLayout.vertical,
    );
  }
}

import 'package:flutter/material.dart';
import '../theme.dart';
import 'custom_card.dart';
import 'metric_card_vertical.dart';
import 'metric_card_horizontal.dart';

enum MetricCardLayout { vertical, horizontal }

class MetricCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String primaryText;
  final String secondaryText;
  final MetricCardLayout layout;
  final VoidCallback? onTap;

  const MetricCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.primaryText,
    required this.secondaryText,
    this.layout = MetricCardLayout.vertical,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final content = layout == MetricCardLayout.vertical
        ? MetricCardVertical(
            icon: icon,
            iconColor: iconColor,
            iconBgColor: iconBgColor,
            primaryText: primaryText,
            secondaryText: secondaryText,
          )
        : MetricCardHorizontal(
            icon: icon,
            iconColor: iconColor,
            iconBgColor: iconBgColor,
            primaryText: primaryText,
            secondaryText: secondaryText,
          );
    return CustomCard(
      onTap: onTap,
      padding: AppSpacing.cardPadding,
      child: content,
    );
  }
}

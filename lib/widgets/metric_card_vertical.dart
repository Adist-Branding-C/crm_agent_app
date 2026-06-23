import 'package:flutter/material.dart';
import '../theme.dart';

class MetricCardVertical extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String primaryText;
  final String secondaryText;

  const MetricCardVertical({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.primaryText,
    required this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36, height: 36,
          decoration: BoxDecoration(color: iconBgColor, borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: iconColor, size: 18),
        ),
        const SizedBox(height: 12),
        Text(primaryText, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.textDark, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
        const SizedBox(height: 2),
        Text(secondaryText, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w500), maxLines: 1, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}

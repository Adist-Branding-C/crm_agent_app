import 'package:flutter/material.dart';
import '../theme.dart';

class MetricCardHorizontal extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String primaryText;
  final String secondaryText;

  const MetricCardHorizontal({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.primaryText,
    required this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40, height: 40,
          decoration: BoxDecoration(color: iconBgColor, borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(primaryText, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textDark, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Text(secondaryText, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textMuted, fontWeight: FontWeight.w500), maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ],
    );
  }
}

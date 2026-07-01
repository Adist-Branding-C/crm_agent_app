import 'package:flutter/material.dart';
import '../../../theme.dart';


/// Displays a labeled metadata row with an icon in task details.
class TaskMetaRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? color;

  const TaskMetaRow({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.textMuted),
          AppSpacing.gapWSm,
          Text(
            '$label: ',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.textMuted),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color ?? AppColors.textDark,
                ),
          ),
        ],
      ),
    );
  }
}

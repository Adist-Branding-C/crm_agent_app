import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/context_text_extension.dart';

/// Displays a labeled metadata row with an icon in task details.
class TaskMetaRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? color;

  const TaskMetaRow({super.key, required this.label, required this.value, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.textMuted),
          const SizedBox(width: 8),
          Text('$label: ', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textMuted)),
          Text(value, style: TextStyle(fontSize: context.scaleFont(14), fontWeight: FontWeight.w600, color: color ?? AppColors.textDark)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/context_text_extension.dart';
import 'attendance_status_theme.dart';

class StatusBadge extends StatelessWidget {
  final String text;
  final bool showDot;

  const StatusBadge({super.key, required this.text, this.showDot = false});

  @override
  Widget build(BuildContext context) {
    final statusTheme = AttendanceStatusTheme.resolve(text);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: statusTheme.bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDot) ...[
            Container(
              width: 6, height: 6,
              decoration: const BoxDecoration(
                color: AppColors.success, shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
          ],
          Text(text, style: TextStyle(
            color: statusTheme.fg,
            fontSize: context.scaleFont(9),
            fontWeight: FontWeight.bold,
          )),
        ],
      ),
    );
  }
}
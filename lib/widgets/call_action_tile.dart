import 'package:flutter/material.dart';
import '../theme.dart';

/// An individual action option item inside the call actions bottom sheet.
class CallActionTile extends StatelessWidget {
  /// The icon representing the action.
  final IconData icon;

  /// The title of the action.
  final String title;

  /// The subtitle of the action (e.g. phone number or details).
  final String subtitle;

  /// The color of the icon.
  final Color iconColor;

  /// The background color for the circular icon container.
  final Color iconBgColor;

  /// The callback to run when the tile is clicked.
  final VoidCallback onTap;

  /// Creates a constant [CallActionTile].
  const CallActionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.iconBgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.slate300,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

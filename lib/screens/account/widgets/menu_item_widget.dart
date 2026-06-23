import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Renders a single menu list item.
class MenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? badge;
  final VoidCallback? onTap;

  /// Creates a [MenuItemWidget].
  const MenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    this.badge,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.slate100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 20, color: AppColors.textMuted),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
            ),
            if (badge != null) ...[
              Text(
                badge!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
            ],
            const Icon(Icons.chevron_right_rounded,
                size: 20, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}

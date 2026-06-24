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
    return Semantics(
      button: true,
      label: title,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.slate100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 20, color: AppColors.textMuted),
              ),
              AppSpacing.gapWLg,
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
                AppSpacing.gapWSm,
              ],
              const Icon(Icons.chevron_right_rounded,
                  size: 20, color: AppColors.textMuted),
            ],
          ),
        ),
      ),
    );
  }
}

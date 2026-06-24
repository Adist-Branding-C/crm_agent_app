import 'package:flutter/material.dart';
import '../theme.dart';

class CallButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double borderRadius;

  const CallButton({super.key, this.onTap, this.borderRadius = 8});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Semantics(
        button: true,
        label: 'Call lead',
        child: Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(borderRadius),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.fourteen,
                vertical: AppSpacing.sm,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.call_rounded,
                    color: AppColors.surfaceWhite,
                    size: 14,
                  ),
                  SizedBox(width: AppSpacing.xs2),
                  Text(
                    'Call',
                    style: TextStyle(
                      color: AppColors.surfaceWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';

class NotificationBell extends StatelessWidget {
  final int count;

  const NotificationBell({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.textDark,
            size: 24,
          ),
        ),
        if (count > 0)
          Positioned(
            top: -2,
            right: -2,
            child: Container(
              padding: EdgeInsets.all(AppSpacing.xs),
              decoration: const BoxDecoration(
                color: AppColors.errorColor,
                shape: BoxShape.circle,
              ),
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: context.scaleFont(9),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Standardized notification bell button with badges.
class NotificationBell extends StatelessWidget {
  final String count;
  const NotificationBell({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: AppTheme.cardShadow,
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.textDark,
            size: 24,
          ),
        ),
        if (count != '0')
          Positioned(
            top: -2,
            right: -2,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColors.errorColor,
                shape: BoxShape.circle,
              ),
              child: Text(
                count,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

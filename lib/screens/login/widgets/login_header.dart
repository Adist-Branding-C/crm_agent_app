import 'package:flutter/material.dart';
import '../../../theme.dart';

/// The header widget displaying the brand logo and title.
class LoginHeader extends StatelessWidget {
  /// Creates a constant [LoginHeader] widget.
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Semantics(
            label: 'CRM Agent Logo',
            image: true,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryAlpha30,
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Icon(
                Icons.people_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
              ),
              children: [
                TextSpan(
                  text: 'CRM ',
                  style: TextStyle(color: AppTheme.textDark),
                ),
                TextSpan(
                  text: 'Agent',
                  style: TextStyle(color: AppTheme.primaryColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Sign in to your agent account',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppTheme.textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

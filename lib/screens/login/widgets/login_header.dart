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
              ),
              child: const Icon(
                Icons.people_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineMedium,
              children: [
                const TextSpan(
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
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Sign in to your agent account',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

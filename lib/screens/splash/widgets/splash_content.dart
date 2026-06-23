import 'package:flutter/material.dart';
import '../../../theme.dart';

/// The layout representation of the brand logo, name, and tagline.
class SplashContent extends StatelessWidget {
  /// Creates a constant [SplashContent] widget.
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Brand Logo
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryAlpha30,
                blurRadius: 24,
                offset: const Offset(0, 8),
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Icon(
            Icons.people_rounded,
            color: Colors.white,
            size: 48,
          ),
        ),
        const SizedBox(height: 24),
        // Brand Name
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w800,
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
        // Tagline
        Text(
          'Connecting you to your leads',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppTheme.textMuted,
            letterSpacing: 0.1,
          ),
        ),
      ],
    );
  }
}

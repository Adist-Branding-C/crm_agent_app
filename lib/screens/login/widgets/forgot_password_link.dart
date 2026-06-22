import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../theme.dart';
import '../../../router/app_routes.dart';

/// Link button to reset passwords.
class ForgotPasswordLink extends StatelessWidget {
  /// Creates a constant [ForgotPasswordLink] widget.
  const ForgotPasswordLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          context.pushNamed(AppRoutes.forgotPassword);
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: const Text(
          'Forgot password?',
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

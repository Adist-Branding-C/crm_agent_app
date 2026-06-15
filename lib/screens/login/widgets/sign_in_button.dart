import 'package:flutter/material.dart';
import '../../../theme.dart';

/// ElevatedButton container initiating authentication request.
class SignInButton extends StatelessWidget {
  /// Creates a constant [SignInButton] widget.
  const SignInButton({super.key, required this.onPressed});

  /// Action callback triggered on button press.
  final void Function(BuildContext) onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Sign In Button',
      child: Container(
        decoration: BoxDecoration(boxShadow: AppTheme.buttonShadow),
        child: ElevatedButton(
          onPressed: () => onPressed(context),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.login_rounded, size: 18),
              SizedBox(width: 8),
              Text('Sign In'),
            ],
          ),
        ),
      ),
    );
  }
}

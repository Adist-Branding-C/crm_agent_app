import 'package:flutter/material.dart';
import 'phone_field.dart';
import 'password_field.dart';

/// Form input fields for credential entry.
class LoginForm extends StatelessWidget {
  /// Creates a constant [LoginForm] widget.
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  /// The email/phone text field controller.
  final TextEditingController emailController;

  /// The password text field controller.
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PhoneField(controller: emailController),
        const SizedBox(height: 20),
        PasswordField(controller: passwordController),
      ],
    );
  }
}

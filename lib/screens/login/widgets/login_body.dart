import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/login/login_bloc.dart';
import '../login_error_extensions.dart';
import 'disclaimer_text.dart';
import 'error_banner.dart';
import 'forgot_password_link.dart';
import 'login_form.dart';
import 'login_header.dart';
import '../../../widgets/custom_button.dart';

/// The main content area of the Login Screen.
class LoginBody extends StatelessWidget {
  /// Creates a constant [LoginBody] widget.
  const LoginBody({
    super.key,
    required this.phoneController,
    required this.passwordController,
  });

  /// The phone controller.
  final TextEditingController phoneController;

  /// The password controller.
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            const LoginHeader(),
            const SizedBox(height: 40),
            LoginForm(
              phoneController: phoneController,
              passwordController: passwordController,
            ),
            const SizedBox(height: 16),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                final activeError = state.phoneError ?? state.passwordError;
                if (activeError != null) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ErrorBanner(message: activeError),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const ForgotPasswordLink(),
            const SizedBox(height: 28),
            CustomButton(
              text: 'Sign In',
              icon: Icons.login_rounded,
              onPressed: () {
                context.read<LoginBloc>().add(const LoginSubmitted());
              },
            ),
            const SizedBox(height: 60),
            const DisclaimerText(),
          ],
        ),
      ),
    );
  }
}

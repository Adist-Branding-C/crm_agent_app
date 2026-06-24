import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/custom_text_field.dart';

/// Form input fields for credential entry.
class LoginForm extends StatelessWidget {
  /// Creates a constant [LoginForm] widget.
  const LoginForm({
    super.key,
    required this.phoneController,
    required this.passwordController,
  });

  /// The phone text field controller.
  final TextEditingController phoneController;

  /// The password text field controller.
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          label: 'Phone Number',
          isRequired: true,
          hintText: '+91 98470 ... or digits',
          controller: phoneController,
          keyboardType: TextInputType.phone,
          onChanged: (value) =>
              context.read<LoginBloc>().add(PhoneChanged(value)),
        ),
        const SizedBox(height: AppSpacing.xl),
        BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (prev, curr) =>
              prev.obscurePassword != curr.obscurePassword,
          builder: (context, state) {
            return CustomTextField(
              label: 'Password',
              isRequired: true,
              hintText: 'Enter password',
              controller: passwordController,
              obscureText: state.obscurePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  state.obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.textMuted,
                  size: 20,
                ),
                onPressed: () {
                  context.read<LoginBloc>().add(
                    const TogglePasswordVisibility(),
                  );
                },
              ),
              onChanged: (value) =>
                  context.read<LoginBloc>().add(PasswordChanged(value)),
            );
          },
        ),
      ],
    );
  }
}

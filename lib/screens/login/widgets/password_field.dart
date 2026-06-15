import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../theme.dart';

/// Maskable text input field for Password credentials.
class PasswordField extends StatelessWidget {
  /// Creates a constant [PasswordField] widget.
  const PasswordField({super.key, required this.controller});

  /// The text field controller.
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  'Password',
                  style: TextStyle(
                    color: AppTheme.textDark,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' *',
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Semantics(
              label: 'Password Input Field',
              textField: true,
              child: TextFormField(
                controller: controller,
                obscureText: state.obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      state.obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppTheme.textMuted,
                      size: 20,
                    ),
                    onPressed: () {
                      context.read<LoginBloc>().add(
                        const TogglePasswordVisibility(),
                      );
                    },
                  ),
                ),
                onChanged: (value) =>
                    context.read<LoginBloc>().add(PasswordChanged(value)),
              ),
            ),
          ],
        );
      },
    );
  }
}

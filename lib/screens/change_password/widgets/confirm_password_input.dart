import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/change_password/change_password_bloc.dart';
import '../../../theme/app_context_theme.dart';
import '../../../widgets/custom_text_field.dart';
import '../change_password_error_extensions.dart';

/// Text field wrapper for confirm password input.
class ConfirmPasswordInput extends StatelessWidget {
  final TextEditingController controller;

  const ConfirmPasswordInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      buildWhen: (p, c) =>
          p.obscureConfirmPassword != c.obscureConfirmPassword ||
          p.confirmPassword != c.confirmPassword,
      builder: (context, state) => CustomTextField(
        label: 'Confirm new password',
        isRequired: true,
        hintText: 'Re-enter new password',
        controller: controller,
        obscureText: state.obscureConfirmPassword,
        errorText: state.confirmPasswordError,
        suffixIcon: IconButton(
          icon: Icon(
            state.obscureConfirmPassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: context.textMuted,
            size: 20,
          ),
          onPressed: () => context.read<ChangePasswordBloc>().add(
            const ToggleConfirmPasswordVisibility(),
          ),
        ),
        onChanged: (val) =>
            context.read<ChangePasswordBloc>().add(ConfirmPasswordChanged(val)),
      ),
    );
  }
}

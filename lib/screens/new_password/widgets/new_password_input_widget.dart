import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/new_password/new_password_bloc.dart';
import '../../../theme/app_context_theme.dart';
import '../../../widgets/custom_text_field.dart';
import 'password_strength_meter.dart';

/// Input field wrapper for the new password input and strength meter.
class NewPasswordInputWidget extends StatelessWidget {
  final TextEditingController controller;

  const NewPasswordInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPasswordBloc, NewPasswordState>(
      buildWhen: (p, c) =>
          p.obscureNewPassword != c.obscureNewPassword ||
          p.newPassword != c.newPassword,
      builder: (context, state) => Column(
        children: [
          CustomTextField(
            label: 'New password',
            isRequired: true,
            hintText: 'Min. 6 characters',
            controller: controller,
            obscureText: state.obscureNewPassword,
            suffixIcon: IconButton(
              icon: Icon(
                state.obscureNewPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: context.textMuted,
                size: 20,
              ),
              onPressed: () => context.read<NewPasswordBloc>().add(
                const ToggleNewPasswordVisibility(),
              ),
            ),
            onChanged: (val) =>
                context.read<NewPasswordBloc>().add(NewPasswordChanged(val)),
          ),
          PasswordStrengthMeter(password: state.newPassword.value),
        ],
      ),
    );
  }
}

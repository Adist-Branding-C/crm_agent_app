import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/new_password/new_password_bloc.dart';
import '../../../theme/app_context_theme.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../utils/context_text_extension.dart';

/// Input field wrapper for the confirm password input and matching text indicator.
class ConfirmPasswordInputWidget extends StatelessWidget {
  final TextEditingController controller;

  const ConfirmPasswordInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPasswordBloc, NewPasswordState>(
      buildWhen: (p, c) =>
          p.obscureConfirmPassword != c.obscureConfirmPassword ||
          p.confirmPassword != c.confirmPassword ||
          p.newPassword != c.newPassword,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            label: 'Confirm password',
            isRequired: true,
            hintText: 'Re-enter password',
            controller: controller,
            obscureText: state.obscureConfirmPassword,
            suffixIcon: IconButton(
              icon: Icon(
                state.obscureConfirmPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: context.textMuted,
                size: 20,
              ),
              onPressed: () => context
                  .read<NewPasswordBloc>()
                  .add(const ToggleConfirmPasswordVisibility()),
            ),
            onChanged: (val) => context
                .read<NewPasswordBloc>()
                .add(NewConfirmPasswordChanged(val)),
          ),
          if (state.confirmPassword.value.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              state.confirmPassword.isValid
                  ? '✓ Passwords match'
                  : "Passwords don't match",
              style: TextStyle(
                color: state.confirmPassword.isValid
                    ? context.success
                    : context.error,
                fontSize: context.scaleFont(13),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

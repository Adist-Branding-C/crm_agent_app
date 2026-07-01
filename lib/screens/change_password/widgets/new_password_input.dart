import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/change_password/change_password_bloc.dart';
import '../../../theme/app_context_theme.dart';
import '../../../widgets/custom_text_field.dart';
import '../change_password_error_extensions.dart';

/// Text field wrapper for new password input.
class NewPasswordInput extends StatelessWidget {
  final TextEditingController controller;

  const NewPasswordInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      buildWhen: (p, c) =>
          p.obscureNewPassword != c.obscureNewPassword ||
          p.newPassword != c.newPassword,
      builder: (context, state) => CustomTextField(
        label: 'New password',
        isRequired: true,
        hintText: 'Enter new password',
        controller: controller,
        obscureText: state.obscureNewPassword,
        errorText: state.newPasswordError,
        suffixIcon: IconButton(
          icon: Icon(
            state.obscureNewPassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: context.textMuted,
            size: 20.s,
          ),
          onPressed: () => context.read<ChangePasswordBloc>().add(
            const ToggleNewPasswordVisibility(),
          ),
        ),
        onChanged: (val) =>
            context.read<ChangePasswordBloc>().add(NewPasswordChanged(val)),
      ),
    );
  }
}

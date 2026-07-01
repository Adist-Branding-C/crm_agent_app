import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/change_password/change_password_bloc.dart';
import '../../../theme/app_context_theme.dart';
import '../../../widgets/custom_text_field.dart';
import '../change_password_error_extensions.dart';

/// Text field wrapper for current password input.
class CurrentPasswordInput extends StatelessWidget {
  final TextEditingController controller;

  const CurrentPasswordInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      buildWhen: (p, c) =>
          p.obscureCurrentPassword != c.obscureCurrentPassword ||
          p.currentPassword != c.currentPassword,
      builder: (context, state) => CustomTextField(
        label: 'Current password',
        isRequired: true,
        hintText: 'Enter current password',
        controller: controller,
        obscureText: state.obscureCurrentPassword,
        errorText: state.currentPasswordError,
        suffixIcon: IconButton(
          icon: Icon(
            state.obscureCurrentPassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: context.textMuted,
            size: 20.s,
          ),
          onPressed: () => context.read<ChangePasswordBloc>().add(
            const ToggleCurrentPasswordVisibility(),
          ),
        ),
        onChanged: (val) =>
            context.read<ChangePasswordBloc>().add(CurrentPasswordChanged(val)),
      ),
    );
  }
}

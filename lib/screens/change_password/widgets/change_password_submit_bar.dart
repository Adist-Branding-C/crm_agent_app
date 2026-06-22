import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../bloc/change_password/change_password_bloc.dart';
import 'change_password_buttons.dart';

class ChangePasswordSubmitBar extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSubmit;

  const ChangePasswordSubmitBar({
    super.key,
    required this.onCancel,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      buildWhen: (p, c) =>
          p.currentPassword.isValid != c.currentPassword.isValid ||
          p.newPassword.isValid != c.newPassword.isValid ||
          p.confirmPassword.isValid != c.confirmPassword.isValid ||
          p.status != c.status,
      builder: (context, state) => ChangePasswordButtons(
        onCancel: onCancel,
        onSubmit: onSubmit,
        isValid: state.currentPassword.isValid &&
            state.newPassword.isValid &&
            state.confirmPassword.isValid,
        isLoading: state.status == FormzSubmissionStatus.inProgress,
      ),
    );
  }
}

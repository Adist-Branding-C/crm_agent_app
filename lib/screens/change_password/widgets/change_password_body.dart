import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../bloc/change_password/change_password_bloc.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/screen_header.dart';
import 'change_password_buttons.dart';
import 'change_password_header.dart';
import 'confirm_password_input.dart';
import 'current_password_input.dart';
import 'new_password_input.dart';

/// Body layout for Change Password screen.
class ChangePasswordBody extends StatelessWidget {
  final TextEditingController currentController;
  final TextEditingController newController;
  final TextEditingController confirmController;
  final VoidCallback onCancel;
  final VoidCallback onSubmit;

  const ChangePasswordBody({
    super.key,
    required this.currentController,
    required this.newController,
    required this.confirmController,
    required this.onCancel,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenHeader(
            title: 'Change Password',
            subtitle: 'Keep your account secure',
            showBackButton: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ChangePasswordHeader(),
                  const SizedBox(height: 16),
                  CustomCard(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        CurrentPasswordInput(controller: currentController),
                        const SizedBox(height: 16),
                        NewPasswordInput(controller: newController),
                        const SizedBox(height: 16),
                        ConfirmPasswordInput(controller: confirmController),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

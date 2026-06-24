import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../bloc/new_password/new_password_bloc.dart';
import '../../../theme/app_spacing.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/responsive_width_container.dart';
import '../../../widgets/screen_header.dart';
import 'confirm_password_input_widget.dart';
import 'new_password_header_widget.dart';
import 'new_password_input_widget.dart';

/// The layout body for the New Password screen.
class NewPasswordBody extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmController;
  final VoidCallback onSubmit;

  const NewPasswordBody({
    super.key,
    required this.passwordController,
    required this.confirmController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenHeader(title: 'New password', showBackButton: true),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
              child: ResponsiveWidthContainer(
                maxWidth: 480,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NewPasswordHeaderWidget(),
                    AppSpacing.gapXxxl,
                    NewPasswordInputWidget(controller: passwordController),
                    AppSpacing.gapXl,
                    ConfirmPasswordInputWidget(controller: confirmController),
                    AppSpacing.gapXxl,
                    BlocBuilder<NewPasswordBloc, NewPasswordState>(
                      buildWhen: (p, c) =>
                          p.newPassword.isValid != c.newPassword.isValid ||
                          p.confirmPassword.isValid !=
                              c.confirmPassword.isValid ||
                          p.status != c.status,
                      builder: (context, state) => CustomButton(
                        text: 'Update Password',
                        icon: Icons.check_rounded,
                        isLoading:
                            state.status == FormzSubmissionStatus.inProgress,
                        onPressed:
                            state.newPassword.isValid &&
                                state.confirmPassword.isValid
                            ? onSubmit
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../bloc/forgot_password/forgot_password_bloc.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_context_theme.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/screen_header.dart';
import '../forgot_password_error_extensions.dart';

/// The body layout for the Forgot Password screen.
class ForgotPasswordBody extends StatelessWidget {
  final TextEditingController phoneController;

  const ForgotPasswordBody({
    super.key,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenHeader(title: 'Forgot password', showBackButton: true),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColorLight,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.phone_android_rounded,
                      color: context.primary,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Enter your phone',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: context.textDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "We'll send a 6-digit OTP to your registered mobile number.",
                    style: TextStyle(fontSize: 14, color: context.textMuted),
                  ),
                  const SizedBox(height: 32),
                  BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    buildWhen: (p, c) =>
                        p.phone != c.phone || p.status != c.status,
                    builder: (context, state) => CustomTextField(
                      label: 'Phone number',
                      isRequired: true,
                      hintText: '+91 98470 ...',
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      errorText: state.phoneError,
                      semanticsLabel: 'Phone Number Input Field',
                      onChanged: (val) => context
                          .read<ForgotPasswordBloc>()
                          .add(ForgotPasswordPhoneChanged(val)),
                    ),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    buildWhen: (p, c) =>
                        p.phone.isValid != c.phone.isValid ||
                        p.status != c.status,
                    builder: (context, state) => CustomButton(
                      text: 'Send OTP',
                      icon: Icons.send_rounded,
                      isLoading:
                          state.status == FormzSubmissionStatus.inProgress,
                      onPressed: () => context
                          .read<ForgotPasswordBloc>()
                          .add(const ForgotPasswordSubmitted()),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../bloc/verify_otp/verify_otp_bloc.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_context_theme.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/screen_header.dart';
import '../verify_otp_error_extensions.dart';
import 'otp_input_widget.dart';
import 'resend_timer_widget.dart';

/// Renders the layout content for the Verify OTP screen.
class VerifyOtpBody extends StatelessWidget {
  final TextEditingController otpController;
  final String phone;

  const VerifyOtpBody({
    super.key,
    required this.otpController,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenHeader(title: 'Verify OTP', showBackButton: true),
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
                      Icons.fingerprint_rounded,
                      color: context.primary,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Enter OTP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: context.textDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We sent a 6-digit code to\n$phone',
                    style: TextStyle(fontSize: 14, color: context.textMuted),
                  ),
                  const SizedBox(height: 32),
                  OtpInputWidget(
                    controller: otpController,
                    onChanged: (val) => context
                        .read<VerifyOtpBloc>()
                        .add(VerifyOtpCodeChanged(val)),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<VerifyOtpBloc, VerifyOtpState>(
                    buildWhen: (p, c) => p.codeError != c.codeError,
                    builder: (context, state) {
                      if (state.codeError != null) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            state.codeError!,
                            style: TextStyle(
                              color: context.error,
                              fontSize: 13,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  BlocBuilder<VerifyOtpBloc, VerifyOtpState>(
                    buildWhen: (p, c) =>
                        p.code.isValid != c.code.isValid ||
                        p.status != c.status,
                    builder: (context, state) => CustomButton(
                      text: 'Verify OTP',
                      icon: Icons.check_rounded,
                      isLoading:
                          state.status == FormzSubmissionStatus.inProgress,
                      onPressed: () => context
                          .read<VerifyOtpBloc>()
                          .add(const VerifyOtpSubmitted()),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const ResendTimerWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

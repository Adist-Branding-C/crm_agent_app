import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../bloc/verify_otp/verify_otp_bloc.dart';
import '../../../theme/app_spacing.dart';
import '../verify_otp_error_extensions.dart';
import '../../../widgets/custom_button.dart';
import 'otp_input_widget.dart';
import 'resend_timer_widget.dart';

class VerifyOtpForm extends StatelessWidget {
  final TextEditingController otpController;

  const VerifyOtpForm({super.key, required this.otpController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacing.gapXxxl,
        OtpInputWidget(
          controller: otpController,
          onChanged: (val) =>
              context.read<VerifyOtpBloc>().add(VerifyOtpCodeChanged(val)),
        ),
        AppSpacing.gapXxl,
        BlocBuilder<VerifyOtpBloc, VerifyOtpState>(
          buildWhen: (p, c) => p.codeError != c.codeError,
          builder: (context, state) {
            if (state.codeError != null) {
              return Padding(
                padding: EdgeInsets.only(bottom: AppSpacing.lg),
                child: Text(
                  state.codeError!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        BlocBuilder<VerifyOtpBloc, VerifyOtpState>(
          buildWhen: (p, c) =>
              p.code.isValid != c.code.isValid || p.status != c.status,
          builder: (context, state) => CustomButton(
            text: 'Verify OTP',
            icon: Icons.check_rounded,
            isLoading: state.status == FormzSubmissionStatus.inProgress,
            onPressed: () =>
                context.read<VerifyOtpBloc>().add(const VerifyOtpSubmitted()),
          ),
        ),
        AppSpacing.gapXxl,
        const ResendTimerWidget(),
      ],
    );
  }
}

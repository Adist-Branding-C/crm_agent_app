import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/verify_otp/verify_otp_bloc.dart';
import '../../../theme/app_context_theme.dart';

/// Shows the OTP resend timer countdown or a clickable "Resend OTP" link.
class ResendTimerWidget extends StatelessWidget {
  const ResendTimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyOtpBloc, VerifyOtpState>(
      buildWhen: (p, c) =>
          p.timerCount != c.timerCount || p.canResend != c.canResend,
      builder: (context, state) {
        if (state.canResend) {
          return Center(
            child: TextButton(
              onPressed: () => context.read<VerifyOtpBloc>().add(
                const VerifyOtpResendRequested(),
              ),
              child: Text(
                'Resend OTP',
                style: TextStyle(
                  color: context.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
        final min = state.timerCount ~/ 60;
        final sec = (state.timerCount % 60).toString().padLeft(2, '0');
        return Center(
          child: Text(
            'Resend OTP in $min:$sec',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: context.textMuted),
          ),
        );
      },
    );
  }
}

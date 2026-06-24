import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import '../../bloc/verify_otp/verify_otp_bloc.dart';
import '../../data/repositories/otp_repository.dart';
import '../../router/app_routes.dart';
import 'widgets/verify_otp_body.dart';

/// Screen container for the OTP Verification flow.
class VerifyOtpScreen extends StatefulWidget {
  final String phone;

  const VerifyOtpScreen({super.key, required this.phone});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => VerifyOtpBloc(
        authRepository: c.read<OtpRepository>(),
        phone: widget.phone,
      ),
      child: BlocListener<VerifyOtpBloc, VerifyOtpState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('OTP Verified successfully!', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white))),
            );
            context.pushReplacementNamed(AppRoutes.newPassword, extra: widget.phone);
          }
        },
        child: Scaffold(
          body: VerifyOtpBody(
            otpController: _otpController,
            phone: widget.phone,
          ),
        ),
      ),
    );
  }
}

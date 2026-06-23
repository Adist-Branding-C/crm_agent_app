import 'package:flutter/material.dart';
import '../../../widgets/responsive_width_container.dart';
import '../../../widgets/screen_header.dart';
import 'verify_otp_header.dart';
import 'verify_otp_form.dart';

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
              child: ResponsiveWidthContainer(
                maxWidth: 480,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerifyOtpHeader(phone: phone),
                    VerifyOtpForm(otpController: otpController),
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

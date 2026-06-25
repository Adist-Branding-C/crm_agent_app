import 'package:flutter/material.dart';
import '../../../theme/app_spacing.dart';
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
          ScreenHeader(
            title: 'Verify OTP',
            showBackButton: true,
            padding: EdgeInsets.only(
              left: AppSpacing.xxl,
              right: AppSpacing.xxl,
              top: AppSpacing.md,
              bottom: AppSpacing.sm,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
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

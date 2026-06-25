import 'package:flutter/material.dart';
import 'package:flutter_sfs/flutter_sfs.dart';
import '../../../theme/app_spacing.dart';
import '../../../widgets/responsive_width_container.dart';
import '../../../widgets/screen_header.dart';
import 'forgot_password_header.dart';
import 'forgot_password_form.dart';

class ForgotPasswordBody extends StatelessWidget {
  final TextEditingController phoneController;

  const ForgotPasswordBody({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         ScreenHeader(
          title: 'Forgot password',
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
            padding:  EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
            child: ResponsiveWidthContainer(
              maxWidth: 480.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ForgotPasswordHeader(),
                  ForgotPasswordForm(phoneController: phoneController),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

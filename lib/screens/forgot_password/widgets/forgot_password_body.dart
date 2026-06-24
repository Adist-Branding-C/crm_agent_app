import 'package:flutter/material.dart';
import '../../../widgets/responsive_width_container.dart';
import '../../../widgets/screen_header.dart';
import 'forgot_password_header.dart';
import 'forgot_password_form.dart';

class ForgotPasswordBody extends StatelessWidget {
  final TextEditingController phoneController;

  const ForgotPasswordBody({
    super.key,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenHeader(title: 'Forgot password', showBackButton: true),
          Expanded(
            child: SingleChildScrollView(
              child: ResponsiveWidthContainer(
                maxWidth: 480,
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

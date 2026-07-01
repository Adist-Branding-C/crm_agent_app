import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/responsive_width_container.dart';
import '../../../widgets/screen_header.dart';
import 'change_password_header.dart';
import 'change_password_submit_bar.dart';
import 'confirm_password_input.dart';
import 'current_password_input.dart';
import 'new_password_input.dart';

class ChangePasswordBody extends StatelessWidget {
  final TextEditingController currentController;
  final TextEditingController newController;
  final TextEditingController confirmController;
  final VoidCallback onCancel;
  final VoidCallback onSubmit;

  const ChangePasswordBody({
    super.key,
    required this.currentController,
    required this.newController,
    required this.confirmController,
    required this.onCancel,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ScreenHeader(
          title: 'Change Password',
          subtitle: 'Keep your account secure',
          showBackButton: true,
          padding: EdgeInsets.fromLTRB(17.0.w, 25.0.h, 17.0.w, 13.0.h),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.xl,
              0,
              AppSpacing.xl,
              AppSpacing.xl,
            ),
            child: ResponsiveWidthContainer(
              maxWidth: 480,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ChangePasswordHeader(),
                  AppSpacing.gapMd,
                  CustomCard(
                    padding: AppSpacing.cardPadding,
                    child: Column(
                      children: [
                        CurrentPasswordInput(controller: currentController),
                        AppSpacing.gapMd,
                        NewPasswordInput(controller: newController),
                        AppSpacing.gapMd,
                        ConfirmPasswordInput(controller: confirmController),
                      ],
                    ),
                  ),
                  AppSpacing.gapLg,
                  ChangePasswordSubmitBar(
                    onCancel: onCancel,
                    onSubmit: onSubmit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

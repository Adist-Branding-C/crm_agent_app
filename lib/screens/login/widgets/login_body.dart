import 'package:crm_agent_app/widgets/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/responsive_width_container.dart';
import '../login_error_extensions.dart';
import 'disclaimer_text.dart';
import 'error_banner.dart';
import 'forgot_password_link.dart';
import 'login_form.dart';
import 'login_header.dart';
import '../../../widgets/custom_button.dart';

/// The main content area of the Login Screen.
class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
    required this.phoneController,
    required this.passwordController,
  });

  final TextEditingController phoneController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:  EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: ResponsiveWidthContainer(
        maxWidth: 480.w,
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             SizedBox(height: AppSpacing.huge),
            const LoginHeader(),
             SizedBox(height: AppSpacing.huge),
            LoginForm(
              phoneController: phoneController,
              passwordController: passwordController,
            ),
            SizedBox(height: AppSpacing.lg),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                final err = state.phoneError ?? state.passwordError;
                if (err == null) return const SizedBox.shrink();
                return Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.lg),
                  child: ErrorBanner(message: err),
                );
              },
            ),
            const ForgotPasswordLink(),
            SizedBox(height: AppSpacing.xxl + AppSpacing.xs),
            BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (prev, curr) => prev.isLoading != curr.isLoading,
              builder: (context, state) => state.isLoading
                  ? AppLoadingWidget()
                  : CustomButton(
                      text: 'Sign In',
                      icon: Icons.login_rounded,
                      buttonStyle: Theme.of(context)
                          .elevatedButtonTheme
                          .style
                          ?.copyWith(
                            backgroundColor: const WidgetStatePropertyAll(
                               AppColors.primaryColor,
                            ),
                          ),
                      onPressed: () => context
                          .read<LoginBloc>()
                          .add(const LoginSubmitted()),
                    ),
            ),
            SizedBox(height: AppSpacing.huge),
            
            const DisclaimerText(),
          ],
        ),
      ),
    );
  }
}

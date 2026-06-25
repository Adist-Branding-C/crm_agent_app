import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../bloc/forgot_password/forgot_password_bloc.dart';
import '../../../theme/app_spacing.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../forgot_password_error_extensions.dart';

class ForgotPasswordForm extends StatelessWidget {
  final TextEditingController phoneController;

  const ForgotPasswordForm({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSpacing.gapXl,
        BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
          buildWhen: (p, c) => p.phone != c.phone || p.status != c.status,
          builder: (context, state) => CustomTextField(
            label: 'Phone number',
            isRequired: true,
            hintText: '+91 98470 ...',
            controller: phoneController,
            keyboardType: TextInputType.phone,
            errorText: state.phoneError,
            semanticsLabel: 'Phone Number Input Field',
            onChanged: (val) => context.read<ForgotPasswordBloc>().add(
              ForgotPasswordPhoneChanged(val),
            ),
          ),
        ),
        AppSpacing.gapXxl,
        BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
          buildWhen: (p, c) =>
              p.phone.isValid != c.phone.isValid || p.status != c.status,
          builder: (context, state) => CustomButton(
            text: 'Send OTP',
            icon: Icons.send_rounded,
            isLoading: state.status == FormzSubmissionStatus.inProgress,
            onPressed: () => context.read<ForgotPasswordBloc>().add(
              const ForgotPasswordSubmitted(),
            ),
          ),
        ),
      ],
    );
  }
}

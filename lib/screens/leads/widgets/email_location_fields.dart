import 'package:flutter/material.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../theme.dart';

class EmailLocationFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController locationController;
  final String? emailError;
  final ValueChanged<String> onEmailChanged;

  const EmailLocationFields({
    super.key,
    required this.emailController,
    required this.locationController,
    this.emailError,
    required this.onEmailChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'Email',
          isRequired: true,
          hintText: 'name@email.com',
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          errorText: emailError,
          onChanged: onEmailChanged,
        ),
        AppSpacing.gapLg,
        CustomTextField(
          label: 'Location',
          hintText: 'City, State',
          controller: locationController,
        ),
      ],
    );
  }
}

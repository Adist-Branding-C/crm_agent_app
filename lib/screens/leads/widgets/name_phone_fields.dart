import 'package:flutter/material.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../theme.dart';

class NamePhoneFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final String? nameError;
  final String? phoneError;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onPhoneChanged;

  const NamePhoneFields({
    super.key,
    required this.nameController,
    required this.phoneController,
    this.nameError,
    this.phoneError,
    required this.onNameChanged,
    required this.onPhoneChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: 'Full Name',
          isRequired: true,
          hintText: 'e.g. Rahul Menon',
          controller: nameController,
          errorText: nameError,
          onChanged: onNameChanged,
        ),
        AppSpacing.gapLg,
        CustomTextField(
          label: 'Phone',
          isRequired: true,
          hintText: '+91 ...',
          controller: phoneController,
          keyboardType: TextInputType.phone,
          errorText: phoneError,
          onChanged: onPhoneChanged,
        ),
      ],
    );
  }
}

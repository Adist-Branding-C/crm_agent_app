import 'package:flutter/material.dart';
import '../../../../theme.dart';
import '../../../../widgets/custom_card.dart';
import '../../../../widgets/custom_text_field.dart';
import 'personal_details_validators.dart';

class PersonalDetailsSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;

  const PersonalDetailsSection({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal details',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        AppSpacing.gapMd,
        CustomCard(
          padding: EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              CustomTextField(
                label: 'Full Name',
                isRequired: true,
                hintText: 'Enter full name',
                controller: nameController,
                validator: (val) => PersonalDetailsValidators.requiredField(val, 'Full Name'),
              ),
              AppSpacing.gapLg,
              CustomTextField(
                label: 'Phone',
                isRequired: true,
                hintText: 'Enter phone number',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator: PersonalDetailsValidators.phone,
              ),
              AppSpacing.gapLg,
              CustomTextField(
                label: 'Email',
                hintText: 'Enter email address',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: PersonalDetailsValidators.email,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

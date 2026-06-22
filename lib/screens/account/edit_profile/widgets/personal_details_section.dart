import 'package:flutter/material.dart';
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
        const Text(
          'Personal details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        CustomCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextField(
                label: 'Full Name',
                isRequired: true,
                hintText: 'Enter full name',
                controller: nameController,
                validator: (val) => PersonalDetailsValidators.requiredField(val, 'Full Name'),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Phone',
                isRequired: true,
                hintText: 'Enter phone number',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator: PersonalDetailsValidators.phone,
              ),
              const SizedBox(height: 16),
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

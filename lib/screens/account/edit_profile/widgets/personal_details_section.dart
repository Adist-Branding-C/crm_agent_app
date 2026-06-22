import 'package:flutter/material.dart';
import '../../../../widgets/custom_card.dart';
import '../../../../widgets/custom_text_field.dart';

/// Form section for agent personal details (Name, Phone, Email).
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
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Full Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Phone',
                isRequired: true,
                hintText: 'Enter phone number',
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Phone number is required';
                  }
                  if (!RegExp(r'^\+?[0-9\s\-]{7,15}$').hasMatch(val.trim())) {
                    return 'Enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Email',
                hintText: 'Enter email address',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val != null && val.trim().isNotEmpty) {
                    final cleanVal = val.trim();
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(cleanVal)) {
                      return 'Enter a valid email address';
                    }
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

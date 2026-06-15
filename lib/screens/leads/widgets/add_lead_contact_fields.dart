import 'package:flutter/material.dart';
import '../../../widgets/custom_text_field.dart';

/// Contact information input fields section with real-time validation error texts.
class AddLeadContactFields extends StatelessWidget {
  /// Controller for name field.
  final TextEditingController nameController;

  /// Controller for phone field.
  final TextEditingController phoneController;

  /// Controller for email field.
  final TextEditingController emailController;

  /// Controller for location field.
  final TextEditingController locationController;

  /// Error message for name field.
  final String? nameError;

  /// Error message for phone field.
  final String? phoneError;

  /// Error message for email field.
  final String? emailError;

  /// Callback executed when name changes.
  final ValueChanged<String> onNameChanged;

  /// Callback executed when phone changes.
  final ValueChanged<String> onPhoneChanged;

  /// Callback executed when email changes.
  final ValueChanged<String> onEmailChanged;

  /// Creates a constant [AddLeadContactFields].
  const AddLeadContactFields({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.locationController,
    this.nameError,
    this.phoneError,
    this.emailError,
    required this.onNameChanged,
    required this.onPhoneChanged,
    required this.onEmailChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CustomTextField(
            label: 'Full Name',
            isRequired: true,
            hintText: 'e.g. Rahul Menon',
            controller: nameController,
            errorText: nameError,
            onChanged: onNameChanged,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Phone',
            isRequired: true,
            hintText: '+91 ...',
            controller: phoneController,
            keyboardType: TextInputType.phone,
            errorText: phoneError,
            onChanged: onPhoneChanged,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Email',
            isRequired: true,
            hintText: 'name@email.com',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            errorText: emailError,
            onChanged: onEmailChanged,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Location',
            hintText: 'City, State',
            controller: locationController,
          ),
        ],
      ),
    );
  }
}

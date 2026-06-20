import 'package:flutter/material.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/custom_text_field.dart';

/// Container card for the contact text fields in the edit enquiry form.
class EditEnquiryContactFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController locationController;

  const EditEnquiryContactFields({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.locationController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          CustomTextField(
            label: 'Full Name',
            isRequired: true,
            hintText: 'Full Name',
            controller: nameController,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Phone',
            isRequired: true,
            hintText: 'Phone',
            controller: phoneController,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Email',
            hintText: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Location',
            hintText: 'Location',
            controller: locationController,
          ),
        ],
      ),
    );
  }
}

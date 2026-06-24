import 'package:flutter/material.dart';
import '../../../theme.dart';
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
      padding: EdgeInsets.all(AppSpacing.lg),
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
      child: Column(
        children: [
          CustomTextField(
            label: 'Full Name',
            isRequired: true,
            hintText: 'Full Name',
            controller: nameController,
          ),
          AppSpacing.gapLg,
          CustomTextField(
            label: 'Phone',
            isRequired: true,
            hintText: 'Phone',
            controller: phoneController,
            keyboardType: TextInputType.phone,
          ),
          AppSpacing.gapLg,
          CustomTextField(
            label: 'Email',
            hintText: 'Email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          AppSpacing.gapLg,
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

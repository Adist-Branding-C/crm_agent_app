import 'package:flutter/material.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/custom_card.dart';

part 'name_phone_fields.dart';
part 'email_location_fields.dart';

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
    return CustomCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _NamePhoneFields(
            nameController: nameController, phoneController: phoneController,
            nameError: nameError, phoneError: phoneError,
            onNameChanged: onNameChanged, onPhoneChanged: onPhoneChanged,
          ),
          const SizedBox(height: 16),
          _EmailLocationFields(
            emailController: emailController, locationController: locationController,
            emailError: emailError, onEmailChanged: onEmailChanged,
          ),
        ],
      ),
    );
  }
}

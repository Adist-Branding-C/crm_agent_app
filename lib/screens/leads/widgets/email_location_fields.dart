part of 'add_lead_contact_fields.dart';

class _EmailLocationFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController locationController;
  final String? emailError;
  final ValueChanged<String> onEmailChanged;

  const _EmailLocationFields({
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

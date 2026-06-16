part of 'custom_text_field.dart';

class _TextFieldLabel extends StatelessWidget {
  final String label;
  final bool isRequired;

  const _TextFieldLabel({
    required this.label,
    required this.isRequired,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textDark,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (isRequired)
          const Text(
            ' *',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}

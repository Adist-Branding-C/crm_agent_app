import 'package:flutter/material.dart';
import 'custom_text_field_label.dart';

/// A reusable custom text form input field.
class CustomTextField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final String hintText;
  final String? Function(String?)? validator;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? semanticsLabel;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isRequired = false,
    this.validator,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.semanticsLabel,
    this.maxLines = 1,
    this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldLabel(label: label, isRequired: isRequired),
        const SizedBox(height: 8),
        Semantics(
          label: semanticsLabel ?? '$label Input Field',
          textField: true,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              errorText: errorText,
              suffixIcon: suffixIcon,
            ),
            validator: validator,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

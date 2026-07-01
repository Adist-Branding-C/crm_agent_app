import 'package:flutter/material.dart';
import '../theme.dart';
import 'custom_text_field_label.dart';
import 'custom_text_field_borders.dart';

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
  final double? height;
  final double? width;

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
    this.height,
    this.width,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final radius = 6.r;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldLabel(label: label, isRequired: isRequired),
        AppSpacing.gapSm,
        Semantics(
          label: semanticsLabel ?? '$label Input Field',
          textField: true,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            obscureText: obscureText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14.s,
              color: AppColors.textDark,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              hintStyle: Theme.of(context).textTheme.bodySmall,
              errorText: errorText,
              suffixIcon: suffixIcon,
              border: CustomTextFieldBorders.buildBorder(color: AppColors.slate300, radius: radius),
              focusedBorder: CustomTextFieldBorders.buildBorder(color: AppColors.primaryColor, radius: radius),
              enabledBorder: CustomTextFieldBorders.buildBorder(color: AppColors.slate300, radius: radius),
              errorBorder: CustomTextFieldBorders.buildBorder(color: AppColors.errorColor, radius: radius),
              focusedErrorBorder: CustomTextFieldBorders.buildBorder(color: AppColors.errorColor, radius: radius),
              disabledBorder: CustomTextFieldBorders.buildBorder(color: AppColors.slate300, radius: radius),
            ),
            validator: validator,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

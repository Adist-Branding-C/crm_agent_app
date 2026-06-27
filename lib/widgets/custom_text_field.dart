import 'package:flutter/material.dart';
import '../theme.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldLabel(label: label, isRequired: isRequired,),
        AppSpacing.gapSm,
        Semantics(
          label: semanticsLabel ?? '$label Input Field',
          textField: true,
          child: SizedBox(
            height: height??70.h,
            width: width,
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              maxLines: maxLines,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 13.s ),
                errorText: errorText,
                suffixIcon: suffixIcon,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.r),
                  borderSide: const BorderSide(color: AppColors.slate300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.r),
                  borderSide:  BorderSide(color: AppColors.primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.r),
                  borderSide: const BorderSide(color: AppColors.slate300),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.r),
                  borderSide: const BorderSide(color: AppColors.errorColor),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.r),
                  borderSide: const BorderSide(color: AppColors.errorColor),
                ),disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.r),
                  borderSide: const BorderSide(color: AppColors.slate300),
                ),
              ),
              validator: validator,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

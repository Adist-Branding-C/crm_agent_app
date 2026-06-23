import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class RemarkField extends StatelessWidget {
  final TextEditingController controller;

  const RemarkField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Remark',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: AppColors.textDark),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLines: 4,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textDark),
            decoration: InputDecoration(
              hintText: 'What was discussed on the call...',
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textMuted),
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primaryColor),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

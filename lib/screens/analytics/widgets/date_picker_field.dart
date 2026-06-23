import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/context_text_extension.dart';

class DatePickerField extends StatelessWidget {
  final String label;
  final String dateStr;
  final VoidCallback onTap;

  const DatePickerField({
    super.key,
    required this.label,
    required this.dateStr,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppColors.textMuted,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderLight),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateStr,
                  style: TextStyle(
                    color: dateStr == 'dd-mm-yyyy' ? AppColors.textMuted : AppColors.textDark,
                    fontSize: context.scaleFont(13),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: AppColors.textMuted,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

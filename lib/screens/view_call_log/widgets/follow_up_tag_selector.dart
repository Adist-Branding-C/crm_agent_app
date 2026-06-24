import 'package:flutter/material.dart';
import '../../../data/models/dashboard_models.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';

class FollowUpTagSelector extends StatelessWidget {
  final FollowUpTag selectedTag;
  final ValueChanged<FollowUpTag> onChanged;

  const FollowUpTagSelector({
    super.key,
    required this.selectedTag,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tag',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
              ),
        ),
        AppSpacing.gapSm,
        Container(
          padding: EdgeInsets.all(AppSpacing.xs),
          decoration: BoxDecoration(
            color: AppColors.slate100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: FollowUpTag.values.map((tag) {
              final isSelected = selectedTag == tag;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onChanged(tag),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tag.label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isSelected ? AppColors.textDark : AppColors.textMuted,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: context.scaleFont(13),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

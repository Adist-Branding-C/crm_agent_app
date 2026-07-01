import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/user_avatar.dart';

class FilterSheetLeadRow extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterSheetLeadRow({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      ListTile(
        onTap: onTap,
        leading: UserAvatar(
          initials: UserAvatar.initialsFromName(name),
          size: 36,
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textDark,
          ),
        ),
        trailing: isSelected
            ? Icon(
                Icons.check_rounded,
                color: AppColors.primaryColor,
                size: 18.s,
              )
            : null,
      ),
      const Divider(height: 1, color: AppColors.borderLight),
    ],
  );
}

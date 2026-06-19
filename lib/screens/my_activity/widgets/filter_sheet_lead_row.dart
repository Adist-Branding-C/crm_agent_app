import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/user_avatar.dart';

class FilterSheetLeadRow extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterSheetLeadRow({super.key, required this.name, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) => Column(children: [
    ListTile(
      onTap: onTap,
      leading: UserAvatar(initials: UserAvatar.initialsFromName(name), size: 36),
      title: Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textDark)),
      trailing: isSelected ? const Icon(Icons.check_rounded, color: AppColors.primaryColor, size: 18) : null,
    ),
    const Divider(height: 1, color: AppColors.borderLight),
  ]);
}

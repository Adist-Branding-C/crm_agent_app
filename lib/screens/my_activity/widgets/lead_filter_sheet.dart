import 'dart:math';
import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../widgets/bottom_sheet_handle.dart';
import '../../../widgets/user_avatar.dart';

String _initials(String name) {
  final parts = name.trim().split(' ');
  if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  return name.substring(0, min(2, name.length)).toUpperCase();
}

class LeadFilterSheet extends StatelessWidget {
  final String selectedLead;
  final List<String> availableLeads;
  final ValueChanged<String?> onSelected;

  const LeadFilterSheet({super.key, required this.selectedLead, required this.availableLeads, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.72,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const BottomSheetHandle(),
            const SizedBox(height: 16),
            const _SheetTitle(),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _AllLeadsRow(isSelected: selectedLead == 'All leads', onTap: () => onSelected('All leads')),
                  ...availableLeads.map((n) => _LeadRow(name: n, isSelected: selectedLead == n, onTap: () => onSelected(n))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SheetTitle extends StatelessWidget {
  const _SheetTitle();
  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Text('Filter by lead', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textDark)),
  );
}

class _AllLeadsRow extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  const _AllLeadsRow({required this.isSelected, required this.onTap});
  @override
  Widget build(BuildContext context) => Column(children: [
    ListTile(
      onTap: onTap,
      leading: const Icon(Icons.people_outline_rounded, size: 22, color: AppColors.textMuted),
      title: const Text('All leads', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textDark)),
      trailing: isSelected ? const Icon(Icons.check_rounded, color: AppColors.primaryColor, size: 18) : null,
    ),
    const Divider(height: 1, color: AppColors.borderLight),
  ]);
}

class _LeadRow extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;
  const _LeadRow({required this.name, required this.isSelected, required this.onTap});
  @override
  Widget build(BuildContext context) => Column(children: [
    ListTile(
      onTap: onTap,
      leading: UserAvatar(initials: _initials(name), size: 36),
      title: Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textDark)),
      trailing: isSelected ? const Icon(Icons.check_rounded, color: AppColors.primaryColor, size: 18) : null,
    ),
    const Divider(height: 1, color: AppColors.borderLight),
  ]);
}

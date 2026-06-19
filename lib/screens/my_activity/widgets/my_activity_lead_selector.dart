import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Dropdown selector for filtering activities by lead name.
class MyActivityLeadSelector extends StatelessWidget {
  final String selectedLead;
  final List<String> availableLeads;
  final ValueChanged<String?> onSelected;

  const MyActivityLeadSelector({
    super.key,
    required this.selectedLead,
    required this.availableLeads,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Row(
          children: [
            const Icon(Icons.person_outline_rounded,
                size: 20, color: AppColors.textMuted),
            const SizedBox(width: 12),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedLead,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded,
                      color: AppColors.textMuted, size: 20),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                  items: _buildItems(),
                  onChanged: onSelected,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildItems() {
    final allLeadsItem = const DropdownMenuItem(
      value: 'All leads',
      child: Text('All leads'),
    );
    final leadItems = availableLeads
        .map((name) => DropdownMenuItem(value: name, child: Text(name)))
        .toList();
    return [allLeadsItem, ...leadItems];
  }
}

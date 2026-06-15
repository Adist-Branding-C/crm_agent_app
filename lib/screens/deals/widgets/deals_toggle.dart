import 'package:flutter/material.dart';
import '../../../../theme.dart';

/// Toggle widget to switch between Pipeline (Kanban) and List views.
class DealsToggle extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  /// Creates a constant [DealsToggle].
  const DealsToggle({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Container(
        height: 44,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFFE2E8F0).withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(child: _buildToggleItem(0, 'Pipeline')),
            Expanded(child: _buildToggleItem(1, 'List')),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleItem(int index, String label) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onChanged(index),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected ? AppTheme.cardShadow : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.textDark : AppColors.textMuted,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

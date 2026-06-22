import 'package:flutter/material.dart';
import '../../../theme.dart';

/// Segmented custom toggle capsule to switch between Log and Calendar views.
class HistoryToggleBar extends StatelessWidget {
  /// Selected tab value ("Log" or "Calendar").
  final String selected;

  /// Triggered callback when tab changes.
  final ValueChanged<String> onChanged;

  /// Creates a [HistoryToggleBar].
  const HistoryToggleBar({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.slate100,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(child: _buildItem('Log')),
          Expanded(child: _buildItem('Calendar')),
        ],
      ),
    );
  }

  Widget _buildItem(String value) {
    final isSelected = selected == value;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? Border.all(color: const Color(0xFFD97706), width: 1.5)
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          value,
          style: TextStyle(
            color: isSelected ? AppColors.textDark : AppColors.textMuted,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

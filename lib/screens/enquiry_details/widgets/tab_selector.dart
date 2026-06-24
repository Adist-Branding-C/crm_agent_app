import 'package:flutter/material.dart';
import '../../../theme.dart';
import '../../../utils/context_text_extension.dart';

/// Tab selector bar displaying Info, Activities, and Notes.
class TabSelector extends StatelessWidget {
  /// The active tab index.
  final int activeTab;

  /// Callback when a tab is tapped.
  final ValueChanged<int> onTabChanged;

  /// Creates a constant [TabSelector].
  const TabSelector({
    super.key,
    required this.activeTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ['Info', 'Activities', 'Notes'];
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderLight, width: 1),
        ),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = activeTab == index;
          return Expanded(
            child: InkWell(
              onTap: () => onTabChanged(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        color: isSelected ? AppColors.primaryColor : AppColors.textMuted,
                        fontWeight: FontWeight.bold,
                        fontSize: context.scaleFont(14),
                      ),
                    ),
                  ),
                  Container(
                    height: 2,
                    color: isSelected ? AppColors.primaryColor : Colors.transparent,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

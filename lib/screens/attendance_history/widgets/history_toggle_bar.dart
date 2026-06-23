import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import 'toggle_item.dart';

/// Segmented custom toggle capsule to switch between Log and Calendar views.
class HistoryToggleBar extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

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
          Expanded(child: ToggleItem(
            value: 'Log', selected: selected,
            onChanged: onChanged,
          )),
          Expanded(child: ToggleItem(
            value: 'Calendar', selected: selected,
            onChanged: onChanged,
          )),
        ],
      ),
    );
  }
}

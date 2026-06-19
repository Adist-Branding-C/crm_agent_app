import 'package:flutter/material.dart';
import '../../../data/models/my_activity/my_activity_enums.dart';
import '../../../widgets/filter_chip_bar.dart';

/// Time-based filter row (All, Today, Yesterday, This Week).
class MyActivityTimeFilters extends StatelessWidget {
  final ActivityTimeFilter selected;
  final ValueChanged<ActivityTimeFilter> onSelected;

  const MyActivityTimeFilters({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChipBar(
      options: ActivityTimeFilter.values.map((f) {
        return FilterChipOption(
          label: f.label,
          isSelected: f == selected,
          onTap: () => onSelected(f),
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../bloc/tasks/tasks_filter_criteria.dart';
import '../../../bloc/tasks/tasks_models.dart';
import 'tasks_filter_date_selector.dart';
import 'tasks_filter_header.dart';
import 'tasks_filter_priority_selector.dart';
import 'tasks_filter_type_selector.dart';

/// Selection form holding all specific filter rows inside the filter sheet.
class TasksFilterForm extends StatelessWidget {
  final Set<TaskType> types;
  final DateRangeType dateRange;
  final DateTime? customFrom;
  final DateTime? customTo;
  final Set<TaskPriority> priorities;
  final ValueChanged<Set<TaskType>> onTypesChanged;
  final ValueChanged<DateRangeType> onDateRangeChanged;
  final Function(DateTime?, DateTime?) onCustomDatesChanged;
  final ValueChanged<Set<TaskPriority>> onPrioritiesChanged;

  const TasksFilterForm({
    super.key,
    required this.types,
    required this.dateRange,
    required this.customFrom,
    required this.customTo,
    required this.priorities,
    required this.onTypesChanged,
    required this.onDateRangeChanged,
    required this.onCustomDatesChanged,
    required this.onPrioritiesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TasksFilterHeader(),
        const SizedBox(height: 20),
        TasksFilterTypeSelector(
          selectedTypes: types,
          onChanged: onTypesChanged,
        ),
        const SizedBox(height: 20),
        TasksFilterDateSelector(
          selectedRange: dateRange,
          customFrom: customFrom,
          customTo: customTo,
          onRangeChanged: onDateRangeChanged,
          onCustomDatesChanged: onCustomDatesChanged,
        ),
        const SizedBox(height: 20),
        TasksFilterPrioritySelector(
          selectedPriorities: priorities,
          onChanged: onPrioritiesChanged,
        ),
      ],
    );
  }
}

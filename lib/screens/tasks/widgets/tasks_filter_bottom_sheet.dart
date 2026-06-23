import 'package:flutter/material.dart';
import '../../../bloc/tasks/tasks_filter_criteria.dart';
import '../../../bloc/tasks/tasks_models.dart';
import 'tasks_filter_actions.dart';
import 'tasks_filter_form.dart';

/// Modal bottom sheet that lets users edit task filter parameters.
class TasksFilterBottomSheet extends StatefulWidget {
  final TaskFilterCriteria initialCriteria;
  const TasksFilterBottomSheet({super.key, required this.initialCriteria});
  @override
  State<TasksFilterBottomSheet> createState() => _TasksFilterBottomSheetState();
}

class _TasksFilterBottomSheetState extends State<TasksFilterBottomSheet> {
  late Set<TaskType> _types;
  late DateRangeType _dateRange;
  DateTime? _customFrom;
  DateTime? _customTo;
  late Set<TaskPriority> _priorities;

  @override
  void initState() {
    super.initState();
    _types = Set.from(widget.initialCriteria.types);
    _dateRange = widget.initialCriteria.dateRange;
    _customFrom = widget.initialCriteria.customFrom;
    _customTo = widget.initialCriteria.customTo;
    _priorities = Set.from(widget.initialCriteria.priorities);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TasksFilterForm(
              types: _types,
              dateRange: _dateRange,
              customFrom: _customFrom,
              customTo: _customTo,
              priorities: _priorities,
              onTypesChanged: (val) => setState(() => _types = val),
              onDateRangeChanged: (val) => setState(() => _dateRange = val),
              onCustomDatesChanged: (f, t) => setState(() {
                _customFrom = f;
                _customTo = t;
              }),
              onPrioritiesChanged: (val) => setState(() => _priorities = val),
            ),
            const SizedBox(height: 24),
            TasksFilterActions(onReset: _reset, onApply: _apply),
          ],
        ),
      ),
    );
  }

  void _reset() => setState(() {
        _types.clear();
        _dateRange = DateRangeType.none;
        _customFrom = null;
        _customTo = null;
        _priorities.clear();
      });

  void _apply() => Navigator.pop(
        context,
        TaskFilterCriteria(
          types: _types,
          dateRange: _dateRange,
          customFrom: _customFrom,
          customTo: _customTo,
          priorities: _priorities,
        ),
      );
}

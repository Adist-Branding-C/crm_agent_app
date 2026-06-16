import 'package:flutter/material.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/tasks_header.dart';
import 'widgets/tasks_filter_tabs.dart';
import 'widgets/tasks_list_view.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          TasksHeader(),
          SizedBox(height: 12),
          TasksFilterTabs(),
          SizedBox(height: 16),
          Expanded(child: TasksListView()),
        ],
      ),
    );
  }
}

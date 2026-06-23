import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/tasks/tasks_bloc.dart';
import '../../bloc/tasks/tasks_models.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import 'widgets/task_details_body.dart';

class TaskDetailsScreen extends StatefulWidget {
  final String taskId;
  const TaskDetailsScreen({super.key, required this.taskId});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<TasksBloc>();
    if (bloc.state is TasksInitial) {
      bloc.add(const LoadTasks());
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      padding: EdgeInsets.zero,
      child: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          if (state is TasksInitial || state is TasksLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TasksError) {
            return const Center(child: Text('Error loading task details'));
          }
          if (state is! TasksLoaded) {
            return const Center(child: CircularProgressIndicator());
          }
          final task = state.allTasks.firstWhere(
            (t) => t.id == widget.taskId,
            orElse: () => Task(
              id: widget.taskId, title: 'Task Not Found', type: TaskType.task,
              time: 'Unknown', isCompleted: false, isOverdue: false,
              priority: TaskPriority.low,
            ),
          );
          return Column(
            children: [
              const ScreenHeader(
                title: 'Task Details',
                showBackButton: true,
                padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: TaskDetailsBody(task: task),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

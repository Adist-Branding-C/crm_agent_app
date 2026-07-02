import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/tasks/tasks_bloc.dart';
import '../../bloc/tasks/tasks_models.dart';
import '../../theme.dart';
import '../../widgets/app_loading_widget.dart';
import '../../widgets/app_error_widget.dart';
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
      child: Column(
        children: [
          const ScreenHeader(title: 'Task Details', showBackButton: true),
          Expanded(
            child: BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                if (state is TasksError) {
                  return AppErrorWidget(
                    message: 'Error loading task details',
                    onRetry: () =>
                        context.read<TasksBloc>().add(const LoadTasks()),
                  );
                }
                if (state is TasksInitial ||
                    state is TasksLoading ||
                    state is! TasksLoaded) {
                  return  AppLoadingWidget();
                }
                final task = state.allTasks.firstWhere(
                  (t) => t.id == widget.taskId,
                  orElse: () => Task(
                    id: widget.taskId,
                    title: 'Task Not Found',
                    type: TaskType.task,
                    time: 'Unknown',
                    isCompleted: false,
                    isOverdue: false,
                    priority: TaskPriority.low,
                  ),
                );
                return SingleChildScrollView(
                  padding: AppSpacing.screenPaddingV,
                  child: TaskDetailsBody(task: task),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

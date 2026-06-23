part of 'tasks_header_actions.dart';

extension TasksHeaderActionsHandlers on TasksHeaderActions {
  Future<void> _openFilter(BuildContext context) async {
    final bloc = context.read<TasksBloc>();
    final state = bloc.state;
    if (state is! TasksLoaded) return;

    final res = await showModalBottomSheet<TaskFilterCriteria>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => TasksFilterBottomSheet(
        initialCriteria: state.filterCriteria,
      ),
    );
    if (res != null) {
      bloc.add(ApplyFilterCriteria(res));
    }
  }

  Future<void> _openAddTask(BuildContext context) async {
    final bloc = context.read<TasksBloc>();
    final isAdded = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider(
        create: (context) => AddTaskBloc(
          tasksRepository: context.read<TasksRepository>(),
        ),
        child: const AddTaskBottomSheet(),
      ),
    );
    if (isAdded == true) {
      bloc.add(const LoadTasks());
    }
  }
}

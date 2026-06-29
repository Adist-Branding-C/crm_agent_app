import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/task_models.dart';
import 'tasks_bloc.dart';

/// Extension containing load and mutation handlers for [TasksBloc].
extension TasksHandlersLoad on TasksBloc {
  void emitFiltered(
    Emitter<TasksState> emit,
    List<Task> all,
    TasksFilter filter,
    TaskFilterCriteria criteria,
    TasksFailure? Function()? actionFailure,
  ) {
    final filtered = applyTasksFiltering(all, filter, criteria, DateTime.now());
    emit(TasksLoaded(
      allTasks: all,
      filteredTasks: filtered,
      filter: filter,
      filterCriteria: criteria,
      actionFailure: actionFailure != null ? actionFailure() : null,
    ));
  }

  Future<void> onLoadTasks(LoadTasks event, Emitter<TasksState> emit) async {
    emit(const TasksLoading());
    try {
      final list = await tasksRepository.getTasks();
      emitFiltered(
        emit,
        list,
        TasksFilter.all,
        const TaskFilterCriteria(),
        null,
      );
    } catch (e) {
      emit(const TasksError(failure: TasksFailure.load));
    }
  }

  void onTaskAdded(TaskAdded event, Emitter<TasksState> emit) {
    final currState = state;
    if (currState is TasksLoaded) {
      final updatedList = List<Task>.from(currState.allTasks)..insert(0, event.task);
      emitFiltered(
        emit,
        updatedList,
        currState.filter,
        currState.filterCriteria,
        null,
      );
    }
  }
}

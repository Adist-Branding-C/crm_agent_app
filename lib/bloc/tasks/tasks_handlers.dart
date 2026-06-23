import 'dart:developer' as developer;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tasks_bloc.dart';

/// Extension containing event handlers for [TasksBloc].
extension TasksHandlers on TasksBloc {
  /// Handler for [LoadTasks] event.
  Future<void> onLoadTasks(
    LoadTasks event,
    Emitter<TasksState> emit,
  ) async {
    emit(const TasksLoading());
    try {
      final list = await tasksRepository.getTasks();
      emit(TasksLoaded(allTasks: list));
    } catch (e) {
      emit(const TasksError(failure: TasksFailure.load));
    }
  }

  /// Handler for [ToggleTaskCompletion] event.
  Future<void> onToggleTaskCompletion(
    ToggleTaskCompletion event,
    Emitter<TasksState> emit,
  ) async {
    final currState = state;
    if (currState is TasksLoaded) {
      try {
        final updatedList =
            await tasksRepository.toggleTaskCompletion(event.taskId);
        emit(currState.copyWith(allTasks: updatedList, actionFailure: () => null));
      } catch (e, stackTrace) {
        developer.log(
          'Failed to toggle task completion for taskId: ${event.taskId}',
          error: e,
          stackTrace: stackTrace,
          name: 'TasksBloc',
        );
        emit(currState.copyWith(actionFailure: () => TasksFailure.toggle));
      }
    }
  }

  /// Handler for [FilterChanged] event.
  void onFilterChanged(
    FilterChanged event,
    Emitter<TasksState> emit,
  ) {
    final currState = state;
    if (currState is TasksLoaded) {
      emit(currState.copyWith(filter: event.filter));
    }
  }

  /// Handler for [ApplyFilterCriteria] event.
  void onApplyFilterCriteria(
    ApplyFilterCriteria event,
    Emitter<TasksState> emit,
  ) {
    final currState = state;
    if (currState is TasksLoaded) {
      emit(currState.copyWith(filterCriteria: event.criteria));
    }
  }

  /// Handler for [ClearActionFailure] event.
  void onClearActionFailure(
    ClearActionFailure event,
    Emitter<TasksState> emit,
  ) {
    final currState = state;
    if (currState is TasksLoaded) {
      emit(currState.copyWith(actionFailure: () => null));
    }
  }
}

import 'dart:developer' as developer;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tasks_bloc.dart';
import 'tasks_handlers_load.dart';

/// Extension containing filter and toggle handlers for [TasksBloc].
extension TasksHandlersFilter on TasksBloc {
  Future<void> onToggleTaskCompletion(
    ToggleTaskCompletion event,
    Emitter<TasksState> emit,
  ) async {
    final currState = state;
    if (currState is TasksLoaded) {
      try {
        final updatedList = await tasksRepository.toggleTaskCompletion(
          event.taskId,
        );
        emitFiltered(
          emit,
          updatedList,
          currState.filter,
          currState.filterCriteria,
          () => null,
        );
      } catch (e, stackTrace) {
        developer.log(
          'Failed to toggle task completion for taskId: ${event.taskId}',
          error: e,
          stackTrace: stackTrace,
          name: 'TasksBloc',
        );
        emitFiltered(
          emit,
          currState.allTasks,
          currState.filter,
          currState.filterCriteria,
          () => TasksFailure.toggle,
        );
      }
    }
  }

  void onFilterChanged(FilterChanged event, Emitter<TasksState> emit) {
    final currState = state;
    if (currState is TasksLoaded) {
      emitFiltered(
        emit,
        currState.allTasks,
        event.filter,
        currState.filterCriteria,
        null,
      );
    }
  }

  void onApplyFilterCriteria(
    ApplyFilterCriteria event,
    Emitter<TasksState> emit,
  ) {
    final currState = state;
    if (currState is TasksLoaded) {
      emitFiltered(
        emit,
        currState.allTasks,
        currState.filter,
        event.criteria,
        null,
      );
    }
  }

  void onClearActionFailure(
    ClearActionFailure event,
    Emitter<TasksState> emit,
  ) {
    final currState = state;
    if (currState is TasksLoaded) {
      emitFiltered(
        emit,
        currState.allTasks,
        currState.filter,
        currState.filterCriteria,
        () => null,
      );
    }
  }
}

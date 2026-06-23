import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/tasks_repository.dart';
import 'tasks_event.dart';
import 'tasks_state.dart';

export 'tasks_filter_criteria.dart';
export 'tasks_selectors.dart';
export 'tasks_event.dart';
export 'tasks_state.dart';

/// BLoC managing states and events for Tasks.
class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TasksRepository tasksRepository;

  /// Initializes the TasksBloc.
  TasksBloc({required this.tasksRepository}) : super(const TasksInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<ToggleTaskCompletion>(_onToggleTaskCompletion);
    on<FilterChanged>(_onFilterChanged);
    on<ApplyFilterCriteria>(_onApplyFilterCriteria);
  }

  Future<void> _onLoadTasks(
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

  Future<void> _onToggleTaskCompletion(
    ToggleTaskCompletion event,
    Emitter<TasksState> emit,
  ) async {
    final currState = state;
    if (currState is TasksLoaded) {
      try {
        final updatedList =
            await tasksRepository.toggleTaskCompletion(event.taskId);
        emit(currState.copyWith(allTasks: updatedList));
      } catch (_) {
        // Fallback or ignore
      }
    }
  }

  void _onFilterChanged(
    FilterChanged event,
    Emitter<TasksState> emit,
  ) {
    final currState = state;
    if (currState is TasksLoaded) {
      emit(currState.copyWith(filter: event.filter));
    }
  }

  void _onApplyFilterCriteria(
    ApplyFilterCriteria event,
    Emitter<TasksState> emit,
  ) {
    final currState = state;
    if (currState is TasksLoaded) {
      emit(currState.copyWith(filterCriteria: event.criteria));
    }
  }
}

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/tasks_repository.dart';
import 'tasks_event.dart';
import 'tasks_state.dart';
import 'tasks_handlers_load.dart';
import 'tasks_handlers_filter.dart';

export 'tasks_filter_criteria.dart';
export 'tasks_selectors.dart';
export 'tasks_event.dart';
export 'tasks_state.dart';

/// BLoC managing states and events for Tasks.
class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TasksRepository tasksRepository;
  StreamSubscription<Task>? _taskAddedSub;

  /// Initializes the TasksBloc.
  TasksBloc({required this.tasksRepository}) : super(const TasksInitial()) {
    on<LoadTasks>(onLoadTasks);
    on<ToggleTaskCompletion>(onToggleTaskCompletion);
    on<FilterChanged>(onFilterChanged);
    on<ApplyFilterCriteria>(onApplyFilterCriteria);
    on<ClearActionFailure>(onClearActionFailure);
    on<TaskAdded>(onTaskAdded);

    _taskAddedSub = tasksRepository.taskAddedStream.listen(
      (task) => add(TaskAdded(task)),
    );
  }

  @override
  Future<void> close() {
    _taskAddedSub?.cancel();
    return super.close();
  }
}

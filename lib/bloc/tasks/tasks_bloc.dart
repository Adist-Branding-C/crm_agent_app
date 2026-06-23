import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/tasks_repository.dart';
import 'tasks_event.dart';
import 'tasks_state.dart';
import 'tasks_handlers.dart';

export 'tasks_filter_criteria.dart';
export 'tasks_selectors.dart';
export 'tasks_event.dart';
export 'tasks_state.dart';

/// BLoC managing states and events for Tasks.
class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final TasksRepository tasksRepository;

  /// Initializes the TasksBloc.
  TasksBloc({required this.tasksRepository}) : super(const TasksInitial()) {
    on<LoadTasks>(onLoadTasks);
    on<ToggleTaskCompletion>(onToggleTaskCompletion);
    on<FilterChanged>(onFilterChanged);
    on<ApplyFilterCriteria>(onApplyFilterCriteria);
    on<ClearActionFailure>(onClearActionFailure);
  }
}

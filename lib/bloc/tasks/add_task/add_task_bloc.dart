import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../data/repositories/tasks_repository.dart';
import '../tasks_models.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';
part 'task_title_input.dart';
part 'task_description_input.dart';

/// BLoC managing the state transitions and form validation of the Add Task form.
class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  /// Repository for saving tasks.
  final TasksRepository tasksRepository;

  /// Initializes the BLoC with [AddTaskState].
  AddTaskBloc({required this.tasksRepository}) : super(const AddTaskState()) {
    on<TaskTitleChanged>(_onTitleChanged);
    on<TaskDescriptionChanged>(_onDescriptionChanged);
    on<TaskTypeChanged>(_onTypeChanged);
    on<TaskDueDateChanged>(_onDueDateChanged);
    on<TaskPriorityChanged>(_onPriorityChanged);
    on<SubmitAddTask>(_onSubmitAddTask);
  }

  void _onTitleChanged(TaskTitleChanged ev, Emitter<AddTaskState> emit) {
    emit(state.copyWith(title: TaskTitleInput.dirty(ev.title)));
  }

  void _onDescriptionChanged(TaskDescriptionChanged ev, Emitter<AddTaskState> emit) {
    emit(state.copyWith(description: TaskDescriptionInput.dirty(ev.description)));
  }

  void _onTypeChanged(TaskTypeChanged ev, Emitter<AddTaskState> emit) {
    emit(state.copyWith(type: ev.type));
  }

  void _onDueDateChanged(TaskDueDateChanged ev, Emitter<AddTaskState> emit) {
    emit(state.copyWith(dueDate: ev.dueDate, dueDateTime: ev.dueDateTime));
  }

  void _onPriorityChanged(TaskPriorityChanged ev, Emitter<AddTaskState> emit) {
    emit(state.copyWith(priority: ev.priority));
  }

  Future<void> _onSubmitAddTask(SubmitAddTask ev, Emitter<AddTaskState> emit) async {
    if (!state.isValid) return;
    emit(state.copyWith(isSubmitting: true, isSuccess: false, errorMessage: () => null));
    try {
      final task = Task(
        title: state.title.value.trim(),
        description: state.description.value.isEmpty ? null : state.description.value.trim(),
        type: state.type,
        time: state.dueDate.trim(),
        isCompleted: false,
        isOverdue: false,
        priority: state.priority,
        dueDate: state.dueDateTime ?? DateTime.now(),
      );
      final assignedTask = await tasksRepository.addTask(task);
      emit(state.copyWith(isSubmitting: false, isSuccess: true, newTask: () => assignedTask));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: () => e.toString()));
    }
  }
}

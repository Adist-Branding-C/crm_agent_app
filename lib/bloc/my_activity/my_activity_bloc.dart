export 'my_activity_event.dart';
export 'my_activity_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import '../../data/repositories/my_activity_repository.dart';

import 'my_activity_event.dart';
import 'my_activity_state.dart';
import 'my_activity_handlers.dart';

/// BLoC managing the My Activity page state and filtering.
class MyActivityBloc extends Bloc<MyActivityEvent, MyActivityState> {
  final MyActivityRepository repository;
  final LeadsRepository leadsRepository;

  /// Initializes the [MyActivityBloc].
  MyActivityBloc({required this.repository, required this.leadsRepository})
    : super(const MyActivityInitial()) {
    on<LoadMyActivity>((e, emit) => myActivityLoad(this, e, emit));
    on<TimeFilterChanged>(
      (e, emit) => myActivityTimeFilterChanged(this, e, emit),
    );
    on<TypeFilterChanged>(
      (e, emit) => myActivityTypeFilterChanged(this, e, emit),
    );
    on<LeadFilterChanged>(
      (e, emit) => myActivityLeadFilterChanged(this, e, emit),
    );
  }
}

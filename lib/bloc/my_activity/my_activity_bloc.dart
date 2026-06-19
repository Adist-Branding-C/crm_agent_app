import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/my_activity_repository.dart';
import '../../data/models/my_activity/my_activity_model.dart';
import '../../data/models/my_activity/my_activity_enums.dart';
import 'my_activity_filter_helper.dart';

part 'my_activity_event.dart';
part 'my_activity_state.dart';
part 'my_activity_handlers.dart';

/// BLoC managing the My Activity page state and filtering.
class MyActivityBloc extends Bloc<MyActivityEvent, MyActivityState> {
  final MyActivityRepository repository;

  /// Initializes the [MyActivityBloc].
  MyActivityBloc({required this.repository})
      : super(const MyActivityInitial()) {
    on<LoadMyActivity>(onLoadMyActivity);
    on<TimeFilterChanged>(onTimeFilterChanged);
    on<TypeFilterChanged>(onTypeFilterChanged);
    on<LeadFilterChanged>(onLeadFilterChanged);
  }
}

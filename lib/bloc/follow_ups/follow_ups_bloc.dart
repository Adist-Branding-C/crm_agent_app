import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'follow_ups_models.dart';
import 'mock_follow_ups.dart';

part 'follow_ups_event.dart';
part 'follow_ups_state.dart';

/// Business logic component managing follow-up call data.
class FollowUpsBloc extends Bloc<FollowUpsEvent, FollowUpsState> {
  /// Initializes the BLoC.
  FollowUpsBloc() : super(const FollowUpsInitial()) {
    on<LoadFollowUps>(_onLoadFollowUps);
    on<TriggerCall>(_onTriggerCall);
  }

  Future<void> _onLoadFollowUps(
    LoadFollowUps event,
    Emitter<FollowUpsState> emit,
  ) async {
    emit(const FollowUpsLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      emit(const FollowUpsLoaded(followUps: mockFollowUps));
    } catch (e) {
      emit(const FollowUpsError('Failed to load follow-ups'));
    }
  }

  Future<void> _onTriggerCall(
    TriggerCall event,
    Emitter<FollowUpsState> emit,
  ) async {
    final s = state;
    if (s is FollowUpsLoaded) {
      final target = s.followUps.firstWhere((f) => f.id == event.followUpId);
      emit(FollowUpsLoaded(followUps: s.followUps, callingName: target.name));
      // Re-emit immediately with null callingName to reset trigger
      emit(FollowUpsLoaded(followUps: s.followUps, callingName: null));
    }
  }
}

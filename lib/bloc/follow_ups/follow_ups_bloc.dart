export 'follow_ups_event.dart';
export 'follow_ups_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/follow_ups_repository.dart';
import 'follow_ups_models.dart';

import 'follow_ups_event.dart';
import 'follow_ups_state.dart';

/// Business logic component managing follow-up call data.
class FollowUpsBloc extends Bloc<FollowUpsEvent, FollowUpsState> {
  final FollowUpsRepository _followUpsRepository;

  FollowUpsBloc({required this._followUpsRepository})
    : super(const FollowUpsInitial()) {
    on<LoadFollowUps>(_onLoadFollowUps);
    on<TriggerCall>(_onTriggerCall);
  }

  Future<void> _onLoadFollowUps(
    LoadFollowUps event,
    Emitter<FollowUpsState> emit,
  ) async {
    emit(const FollowUpsLoading());
    try {
      final followUps = await _followUpsRepository.getFollowUps();
      emit(FollowUpsLoaded(followUps: followUps));
    } catch (e) {
      emit(const FollowUpsError(FollowUpsFailure.load));
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
    }
  }
}

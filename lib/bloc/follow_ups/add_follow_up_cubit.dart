import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/dashboard_models.dart';
import '../../../data/models/follow_up_models.dart';
import '../../../data/repositories/dashboard_repository.dart';
import '../../../data/repositories/follow_ups_repository.dart';
import '../leads/leads_models.dart';

abstract class AddFollowUpState {}

class AddFollowUpInitial extends AddFollowUpState {}

class AddFollowUpLoading extends AddFollowUpState {}

class AddFollowUpSuccess extends AddFollowUpState {}

class AddFollowUpFailure extends AddFollowUpState {
  final String message;
  AddFollowUpFailure(this.message);
}

class AddFollowUpCubit extends Cubit<AddFollowUpState> {
  final DashboardRepository dashboardRepository;
  final FollowUpsRepository followUpsRepository;

  AddFollowUpCubit({
    required this.dashboardRepository,
    required this.followUpsRepository,
  }) : super(AddFollowUpInitial());

  Future<void> submitFollowUp({
    required Lead lead,
    required String time,
    required DateTime scheduledTime,
    required FollowUpTag tag,
  }) async {
    emit(AddFollowUpLoading());
    try {
      final fc = FollowUpCall(
        id: lead.id,
        tag: tag,
        name: 'Call back ${lead.name}',
        time: time,
        scheduledTime: scheduledTime,
      );
      final f = FollowUp(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: lead.name,
        category: lead.source,
        status: lead.status,
        scheduledTime: scheduledTime,
      );
      await dashboardRepository.addFollowUp(fc);
      await followUpsRepository.addFollowUp(f);
      emit(AddFollowUpSuccess());
    } catch (e) {
      emit(AddFollowUpFailure(e.toString()));
    }
  }
}

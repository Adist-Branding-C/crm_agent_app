import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/activity_repository.dart';
import '../../data/repositories/leads_repository.dart';
import 'enquiry_details_event.dart';
import 'enquiry_details_state.dart';
import 'enquiry_details_handlers.dart';

export 'enquiry_details_event.dart';
export 'enquiry_details_state.dart';

class EnquiryDetailsBloc
    extends Bloc<EnquiryDetailsEvent, EnquiryDetailsState> {
  final LeadsRepository leadsRepository;
  final ActivityRepository activityRepository;

  EnquiryDetailsBloc({
    required this.leadsRepository,
    required this.activityRepository,
  }) : super(EnquiryDetailsInitial()) {
    on<LoadEnquiryDetails>(onLoad);
    on<ChangeEnquiryStatus>(onChangeStatus);
    on<AddEnquiryNote>(onAddNote);
    on<DeleteEnquiry>(onDelete);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import 'enquiry_details_event.dart';
import 'enquiry_details_state.dart';
import 'enquiry_details_models.dart';

part 'enquiry_details_handlers.dart';

/// BLoC to manage the Enquiry Details state and business logic.
class EnquiryDetailsBloc
    extends Bloc<EnquiryDetailsEvent, EnquiryDetailsState> {
  final LeadsRepository leadsRepository;

  EnquiryDetailsBloc({required this.leadsRepository})
      : super(EnquiryDetailsInitial()) {
    on<LoadEnquiryDetails>(_onLoad);
    on<ChangeEnquiryStatus>(_onChangeStatus);
    on<AddEnquiryNote>(_onAddNote);
    on<DeleteEnquiry>(_onDelete);
  }
}

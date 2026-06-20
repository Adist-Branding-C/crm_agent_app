import 'package:flutter_bloc/flutter_bloc.dart';
import '../enquiry_details_bloc.dart';

extension DeleteHandler on EnquiryDetailsBloc {
  Future<void> onDelete(DeleteEnquiry ev, Emitter<EnquiryDetailsState> emit) async {
    final s = state;
    if (s is! EnquiryDetailsLoaded) return;
    await leadsRepository.deleteLead(s.lead.id);
    emit(EnquiryDetailsDeleted());
  }
}

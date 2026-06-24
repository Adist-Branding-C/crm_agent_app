import 'package:flutter_bloc/flutter_bloc.dart';
import '../enquiry_details_bloc.dart';

extension DeleteHandler on EnquiryDetailsBloc {
  Future<void> onDelete(DeleteEnquiry ev, Emitter<EnquiryDetailsState> emit) async {
    final s = state;
    if (s is! EnquiryDetailsLoaded) return;
    try {
      await leadsRepository.deleteLead(s.lead.id);
      emit(EnquiryDetailsDeleted());
    } catch (_) {
      emit(const EnquiryDetailsError(EnquiryDetailsFailure.unknown));
    }
  }
}

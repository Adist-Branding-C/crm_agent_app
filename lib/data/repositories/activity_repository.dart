import '../../bloc/enquiry_details/enquiry_details_models.dart';

/// Repository interface for lead activity management.
abstract class ActivityRepository {
  /// Retrieves activities logged for a lead.
  List<EnquiryActivity> getActivitiesForLead(String leadId);

  /// Adds an activity for a lead.
  void addActivityForLead(String leadId, EnquiryActivity activity);
}

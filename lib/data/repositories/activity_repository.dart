import '../models/activity_models.dart';

/// Repository interface for lead activity management.
abstract class ActivityRepository {
  /// Retrieves activities logged for a lead.
  List<EnquiryActivity> getActivitiesForLead(String leadId);

  /// Adds an activity for a lead.
  void addActivityForLead(String leadId, EnquiryActivity activity);

  /// Updates an existing activity for a lead.
  void updateActivityForLead(String leadId, EnquiryActivity activity);
}

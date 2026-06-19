import '../models/activity_models.dart';

/// Data source interface for lead activity management.
abstract class ActivityDataSource {
  /// Retrieves activities logged for a lead.
  List<EnquiryActivity> fetchActivitiesForLead(String leadId);

  /// Adds an activity for a lead.
  void insertActivityForLead(String leadId, EnquiryActivity activity);
}

/// In-memory implementation of [ActivityDataSource].
class ActivityDataSourceImpl implements ActivityDataSource {
  final Map<String, List<EnquiryActivity>> _activities = {};

  @override
  List<EnquiryActivity> fetchActivitiesForLead(String leadId) {
    return _activities[leadId] ?? const [];
  }

  @override
  void insertActivityForLead(String leadId, EnquiryActivity activity) {
    final list = _activities[leadId] ?? [];
    _activities[leadId] = [activity, ...list];
  }
}

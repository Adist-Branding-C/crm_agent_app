import '../models/activity_models.dart';

/// Data source interface for lead activity management.
abstract class ActivityDataSource {
  /// Retrieves activities logged for a lead.
  List<EnquiryActivity> fetchActivitiesForLead(String leadId);

  /// Adds an activity for a lead.
  void insertActivityForLead(String leadId, EnquiryActivity activity);

  /// Updates an existing activity for a lead.
  void updateActivityForLead(String leadId, EnquiryActivity activity);
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

  @override
  void updateActivityForLead(String leadId, EnquiryActivity activity) {
    final list = _activities[leadId] ?? [];
    final idx = list.indexWhere((a) => a.id == activity.id);
    if (idx != -1) {
      list[idx] = activity;
      _activities[leadId] = List.from(list);
    }
  }
}

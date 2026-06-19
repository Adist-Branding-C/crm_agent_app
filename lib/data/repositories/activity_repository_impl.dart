import '../models/activity_models.dart';
import '../datasources/activity_datasource.dart';
import 'activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityDataSource activityDataSource;

  ActivityRepositoryImpl({required this.activityDataSource});

  @override
  List<EnquiryActivity> getActivitiesForLead(String leadId) {
    return activityDataSource.fetchActivitiesForLead(leadId);
  }

  @override
  void addActivityForLead(String leadId, EnquiryActivity activity) {
    activityDataSource.insertActivityForLead(leadId, activity);
  }
}

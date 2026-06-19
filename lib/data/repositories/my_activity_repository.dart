import '../../../data/models/my_activity/my_activity_model.dart';

/// Repository interface for My Activity page.
abstract class MyActivityRepository {
  /// Retrieves all activity items.
  List<MyActivityItem> getAllActivities();
}

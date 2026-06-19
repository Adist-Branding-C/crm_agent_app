import '../../../data/models/my_activity/my_activity_model.dart';
import '../../../data/models/my_activity/mock_my_activity_data.dart';

/// Data source interface for My Activity page.
abstract class MyActivityDataSource {
  /// Retrieves all activity items.
  List<MyActivityItem> fetchAllActivities();
}

/// In-memory implementation using mock data.
class MyActivityDataSourceImpl implements MyActivityDataSource {
  @override
  List<MyActivityItem> fetchAllActivities() {
    return MockMyActivityData.items;
  }
}

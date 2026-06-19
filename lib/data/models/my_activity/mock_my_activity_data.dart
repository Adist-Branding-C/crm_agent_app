import 'my_activity_model.dart';
import 'mock_my_activity_batch_one.dart';
import 'mock_my_activity_batch_two.dart';

/// Provides static mock data for My Activity page.
class MockMyActivityData {
  MockMyActivityData._();

  static final List<MyActivityItem> items = [
    ...firstBatchActivities(),
    ...secondBatchActivities(),
  ];
}

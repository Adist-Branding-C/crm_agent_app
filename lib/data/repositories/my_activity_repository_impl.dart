import '../../../data/models/my_activity/my_activity_model.dart';
import '../datasources/my_activity_datasource.dart';
import 'my_activity_repository.dart';

/// Concrete implementation of [MyActivityRepository].
class MyActivityRepositoryImpl implements MyActivityRepository {
  final MyActivityDataSource dataSource;

  /// Creates a [MyActivityRepositoryImpl].
  const MyActivityRepositoryImpl({required this.dataSource});

  @override
  List<MyActivityItem> getAllActivities() {
    return dataSource.fetchAllActivities();
  }
}

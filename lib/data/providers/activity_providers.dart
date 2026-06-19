import 'package:flutter_bloc/flutter_bloc.dart';
import '../datasources/activity_datasource.dart';
import '../datasources/my_activity_datasource.dart';
import '../repositories/activity_repository.dart';
import '../repositories/activity_repository_impl.dart';
import '../repositories/my_activity_repository.dart';
import '../repositories/my_activity_repository_impl.dart';

List<RepositoryProvider> buildActivityProviders() {
  final activityDs = ActivityDataSourceImpl();
  final myActivityDs = MyActivityDataSourceImpl();
  return [
    RepositoryProvider<ActivityRepository>(
      create: (_) => ActivityRepositoryImpl(activityDataSource: activityDs),
    ),
    RepositoryProvider<MyActivityRepository>(
      create: (_) => MyActivityRepositoryImpl(dataSource: myActivityDs),
    ),
  ];
}

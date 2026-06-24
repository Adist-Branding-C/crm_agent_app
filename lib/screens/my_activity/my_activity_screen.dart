import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/my_activity/my_activity_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import '../../data/repositories/my_activity_repository.dart';
import 'widgets/my_activity_body.dart';

class MyActivityScreen extends StatelessWidget {
  const MyActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activityRepo = context.read<MyActivityRepository>();
    final leadsRepo = context.read<LeadsRepository>();
    return BlocProvider(
      create: (_) => MyActivityBloc(repository: activityRepo, leadsRepository: leadsRepo)..add(const LoadMyActivity()),
      child: const MyActivityBody(),
    );
  }
}



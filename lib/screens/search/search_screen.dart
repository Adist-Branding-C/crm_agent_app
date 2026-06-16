import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/search/search_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../data/repositories/spotlight_repository.dart';
import '../../data/repositories/follow_ups_repository.dart';
import '../../widgets/page_scaffold.dart';
import 'widgets/search_content.dart';

/// Screen representing the universal search module.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => SearchBloc(
        leadsRepo: c.read<LeadsRepository>(),
        tasksRepo: c.read<TasksRepository>(),
        spotlightRepo: c.read<SpotlightRepository>(),
        followUpsRepo: c.read<FollowUpsRepository>(),
      ),
      child: PageScaffold(
        padding: EdgeInsets.zero,
        child: SearchContent(controller: _controller),
      ),
    );
  }
}

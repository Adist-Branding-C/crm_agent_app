import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/search/search_bloc.dart';
import '../../data/repositories/leads_repository.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../data/repositories/spotlight_repository.dart';
import '../../theme.dart';
import '../../widgets/page_scaffold.dart';
import '../../widgets/screen_header.dart';
import 'widgets/recent_section.dart';
import 'widgets/search_field.dart';
import 'widgets/search_results_list.dart';

/// Screen representing the universal search module.
class SearchScreen extends StatefulWidget {
  /// Creates a constant [SearchScreen].
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
      ),
      child: PageScaffold(
        padding: EdgeInsets.zero,
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                const ScreenHeader(
                  title: 'Search',
                  showBackButton: false,
                  padding: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
                ),
                SearchField(
                  controller: _controller,
                  onChanged: (q) => context.read<SearchBloc>().add(SearchQueryChanged(q)),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is SearchLoaded) {
                        return SearchResultsList(state: state);
                      }
                      if (state is SearchError) {
                        return Center(
                          child: Text(state.message, style: const TextStyle(color: AppColors.errorColor)),
                        );
                      }
                      final recent = state is SearchInitial ? state.recentQueries : const <String>[];
                      return RecentSection(
                        queries: recent,
                        onTap: (q) {
                          _controller.text = q;
                          context.read<SearchBloc>().add(SearchQueryChanged(q));
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

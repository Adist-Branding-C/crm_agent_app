import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/search/search_bloc.dart';
import '../../../theme.dart';
import '../../../widgets/screen_header.dart';
import 'search_field.dart';
import 'search_results_list.dart';
import 'search_suggestions.dart';

String _searchErrorString(SearchFailure f) {
  switch (f) {
    case SearchFailure.load:
      return 'Failed to load search data';
    case SearchFailure.query:
      return 'Search failed';
    case SearchFailure.unknown:
      return 'An error occurred';
  }
}

/// Renders the search screen content containing header, input field, and list.
class SearchContent extends StatelessWidget {
  /// The search text field controller.
  final TextEditingController controller;

  /// Creates a constant [SearchContent].
  const SearchContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ScreenHeader(
          title: 'Search',
          showBackButton: false,
          padding: EdgeInsets.only(
            left: AppSpacing.xxl,
            right: AppSpacing.xxl,
            top: AppSpacing.lg,
            bottom: AppSpacing.sm,
          ),
        ),
        SearchField(
          controller: controller,
          onChanged: (q) =>
              context.read<SearchBloc>().add(SearchQueryChanged(q)),
        ),
        AppSpacing.gapLg,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            buildWhen: (prev, curr) =>
                prev.runtimeType != curr.runtimeType ||
                (curr is SearchLoaded &&
                    (prev as SearchLoaded?)?.results != curr.results),
            builder: (context, state) {
              if (state is SearchLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is SearchLoaded) {
                return SearchResultsList(state: state);
              }
              if (state is SearchError) {
                return Center(
                  child: Text(
                    _searchErrorString(state.failure),
                    style: const TextStyle(color: AppColors.errorColor),
                  ),
                );
              }
              if (state is SearchInitial) {
                return SearchSuggestions(
                  recentQueries: state.recentQueries,
                  onTapRecent: (q) {
                    controller.text = q;
                    context.read<SearchBloc>().add(SearchQueryChanged(q));
                  },
                  leads: state.suggestedLeads,
                  tasks: state.suggestedTasks,
                  followUps: state.suggestedFollowUps,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}

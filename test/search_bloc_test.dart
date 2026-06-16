import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/bloc/search/search_bloc.dart';
import 'package:crm_agent_app/data/repositories/leads_repository_impl.dart';
import 'package:crm_agent_app/data/repositories/tasks_repository_impl.dart';
import 'package:crm_agent_app/data/repositories/spotlight_repository_impl.dart';
import 'package:crm_agent_app/data/repositories/follow_ups_repository_impl.dart';
import 'package:crm_agent_app/data/datasources/leads_datasource.dart';

void main() {
  group('SearchBloc Unit Tests', () {
    late SearchBloc bloc;
    setUp(() => bloc = SearchBloc(
      leadsRepo: LeadsRepositoryImpl(leadsDataSource: LeadsDataSourceImpl()),
      tasksRepo: TasksRepositoryImpl(),
      spotlightRepo: SpotlightRepositoryImpl(),
      followUpsRepo: FollowUpsRepositoryImpl(),
    ));
    tearDown(() => bloc.close());

    test('initial state and loading suggestions', () {
      expect(bloc.state, const SearchInitial());
      expect((bloc.state as SearchInitial).recentQueries, isEmpty);
      expectLater(bloc.stream, emitsInOrder([
        const SearchLoading(),
        isA<SearchInitial>()
            .having((s) => s.suggestedLeads.length, 'leads', 2)
            .having((s) => s.suggestedTasks.length, 'tasks', 2)
            .having((s) => s.suggestedFollowUps.length, 'followUps', 2),
      ]));
      bloc.add(const InitializeSearch());
    });

    test('SearchQueryChanged results matching and empty results', () async {
      expectLater(bloc.stream, emitsInOrder([
        const SearchLoading(),
        isA<SearchLoaded>().having((s) => s.groupedResults['Leads']?.length == 1 &&
            s.groupedResults['Tasks']?.length == 1 &&
            s.groupedResults['Spotlights']?.length == 1 &&
            s.groupedResults['Follow-ups']?.length == 1, 'matches all 4 domains', true),
        const SearchLoading(),
        isA<SearchLoaded>().having((s) => s.results.any((r) => r.title.contains('Vishnu')), 'partial match', true),
        const SearchLoading(),
        isA<SearchLoaded>().having((s) => s.results.isEmpty, 'empty results', true),
      ]));
      bloc.add(const SearchQueryChanged('Vishnu'));
      await bloc.stream.firstWhere((s) => s is SearchLoaded);
      bloc.add(const SearchQueryChanged('V'));
      await bloc.stream.firstWhere((s) => s is SearchLoaded);
      bloc.add(const SearchQueryChanged('xyz123abc'));
    });

    test('empty query, clear search, and 3-item chronological history limit', () async {
      expectLater(bloc.stream, emitsInOrder([
        const SearchLoading(), isA<SearchInitial>(),
        const SearchLoading(), isA<SearchInitial>(),
        const SearchLoading(), isA<SearchLoaded>(),
        const SearchLoading(), isA<SearchLoaded>(),
        const SearchLoading(), isA<SearchLoaded>(),
        const SearchLoading(), isA<SearchLoaded>(),
        const SearchLoading(), isA<SearchLoaded>(),
        const SearchLoading(), isA<SearchLoaded>(),
        const SearchLoading(),
        isA<SearchInitial>().having((s) => s.recentQueries, 'history', ['b', 'e', 'd']),
      ]));
      bloc.add(const SearchQueryChanged(''));
      await bloc.stream.firstWhere((s) => s is SearchInitial);
      bloc.add(const ClearSearch());
      await bloc.stream.firstWhere((s) => s is SearchInitial);
      for (final q in ['a', 'b', 'c', 'd', 'e', 'b']) {
        bloc.add(SearchQueryChanged(q));
        await bloc.stream.firstWhere((s) => s is SearchLoaded);
      }
      bloc.add(const ClearSearch());
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/bloc/search/search_bloc.dart';
import 'package:crm_agent_app/data/repositories/leads_repository_impl.dart';
import 'package:crm_agent_app/data/repositories/tasks_repository_impl.dart';
import 'package:crm_agent_app/data/repositories/spotlight_repository.dart';
import 'package:crm_agent_app/data/repositories/follow_ups_repository.dart';
import 'package:crm_agent_app/data/datasources/leads_datasource.dart';

void main() {
  group('SearchBloc Unit Tests', () {
    late SearchBloc bloc;

    setUp(() {
      bloc = SearchBloc(
        leadsRepo: LeadsRepositoryImpl(leadsDataSource: LeadsDataSourceImpl()),
        tasksRepo: TasksRepositoryImpl(),
        spotlightRepo: SpotlightRepositoryImpl(),
        followUpsRepo: FollowUpsRepositoryImpl(),
      );
    });

    tearDown(() => bloc.close());

    test('initial state is SearchInitial with default recent queries', () {
      expect(bloc.state, const SearchInitial());
      expect((bloc.state as SearchInitial).recentQueries.length, 3);
    });

    test('SearchQueryChanged with "Vishnu" matches all 4 domains', () {
      expectLater(
        bloc.stream,
        emitsInOrder([
          const SearchLoading(),
          isA<SearchLoaded>().having((s) {
            final groups = s.groupedResults;
            return groups['Leads']?.length == 1 &&
                groups['Tasks']?.length == 1 &&
                groups['Spotlights']?.length == 1 &&
                groups['Follow-ups']?.length == 1;
          }, 'matches all 4 domains', true),
        ]),
      );
      bloc.add(const SearchQueryChanged('Vishnu'));
    });

    test('SearchQueryChanged with "V" matches all 4 domains (partial search)', () {
      expectLater(
        bloc.stream,
        emitsInOrder([
          const SearchLoading(),
          isA<SearchLoaded>().having((s) => s.results.any((r) => r.title.contains('Vishnu')), 'partial match found', true),
        ]),
      );
      bloc.add(const SearchQueryChanged('V'));
    });

    test('SearchQueryChanged with empty string resets to SearchInitial', () {
      expectLater(bloc.stream, emitsInOrder([const SearchInitial()]));
      bloc.add(const SearchQueryChanged(''));
    });

    test('SearchQueryChanged with non-existent query yields empty results', () {
      expectLater(
        bloc.stream,
        emitsInOrder([
          const SearchLoading(),
          isA<SearchLoaded>().having((s) => s.results.isEmpty, 'empty results', true),
        ]),
      );
      bloc.add(const SearchQueryChanged('xyz123abc'));
    });

    test('ClearSearch resets to SearchInitial', () {
      expectLater(bloc.stream, emitsInOrder([const SearchInitial()]));
      bloc.add(const ClearSearch());
    });
  });
}

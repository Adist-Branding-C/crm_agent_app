import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/bloc/call_log/call_log_bloc.dart';
import 'package:crm_agent_app/bloc/leads/leads_models.dart';
import 'package:crm_agent_app/bloc/leads/leads_enums.dart';
import 'mock_repositories.dart';

void main() {
  group('CallLogBloc', () {
    late MockLeadsRepo repo;
    late MockDialer dialer;
    late CallLogBloc bloc;
    final lead = Lead(
      id: '1',
      name: 'Rahul',
      status: LeadStatus.newStatus,
      source: LeadPurpose.enquiry,
      category: LeadCategory.hot,
      phone: '987',
      location: 'Kochi',
    );

    setUp(() {
      repo = MockLeadsRepo()..leads.add(lead);
      dialer = MockDialer();
      bloc = CallLogBloc(
        leadsRepository: repo,
        activityRepository: repo,
        dialerService: dialer,
      );
    });

    test('Initial state', () => expect(bloc.state, const CallLogInitial()));

    test('InitiateCall triggers bottom sheet state', () async {
      expectLater(
        bloc.stream,
        emitsInOrder([CallLogBottomSheetTriggered(lead: lead)]),
      );
      bloc.add(InitiateCall(lead: lead));
    });

    test('LaunchDialer triggers state change & dialer', () async {
      expectLater(bloc.stream, emitsInOrder([CallInProgress(lead: lead)]));
      bloc.add(LaunchDialer(lead: lead));
      await Future.delayed(const Duration(milliseconds: 10));
      expect(dialer.called, lead.phone);
    });

    test('AppReturnedFromCall navigation', () async {
      bloc.emit(CallInProgress(lead: lead));
      expectLater(
        bloc.stream,
        emitsInOrder([CallLogNavigationPending(lead: lead)]),
      );
      bloc.add(const AppReturnedFromCall());
    });

    test('SaveCallLog success', () async {
      expectLater(
        bloc.stream,
        emitsInOrder([
          const CallLogSaving(),
          isA<CallLogSaveSuccess>().having(
            (s) => s.lead.status,
            'status',
            LeadStatus.interested,
          ),
        ]),
      );
      bloc.add(
        SaveCallLog(
          lead: lead,
          callStatus: 'Connected',
          leadStatus: LeadStatus.interested,
          purpose: LeadPurpose.newAdmission,
          remark: 'ok',
        ),
      );
      await Future.delayed(const Duration(milliseconds: 10));
      expect(repo.leads.first.status, LeadStatus.interested);
    });
  });
}

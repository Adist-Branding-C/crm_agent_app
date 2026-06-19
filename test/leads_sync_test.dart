import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/bloc/leads/leads_bloc.dart';
import 'package:crm_agent_app/bloc/leads/leads_models.dart';
import 'package:crm_agent_app/bloc/leads/leads_enums.dart';
import 'package:crm_agent_app/data/repositories/activity_repository.dart';
import 'package:crm_agent_app/data/repositories/leads_repository.dart';
import 'package:crm_agent_app/bloc/enquiry_details/enquiry_details_models.dart';

class FakeLeadsRepository implements LeadsRepository, ActivityRepository {
  final List<Lead> leads = [];
  final _controller = StreamController<String>.broadcast();
  @override
  Stream<String> get leadDeletedStream => _controller.stream;
  @override
  Future<List<Lead>> getLeads() async => List.from(leads);
  @override
  Future<Lead> addLead(Lead lead) async { leads.add(lead); return lead; }
  @override
  Future<Lead?> getLeadById(String id) async {
    try {
      return leads.firstWhere((l) => l.id == id);
    } catch (_) {
      _controller.add(id);
      return null;
    }
  }
  @override
  Future<void> updateLead(Lead lead) async {}
  @override
  Future<void> deleteLead(String id) async {
    leads.removeWhere((l) => l.id == id);
    _controller.add(id);
  }
  @override
  List<EnquiryActivity> getActivitiesForLead(String leadId) => [];
  @override
  void addActivityForLead(String id, EnquiryActivity act) {}

  @override
  void dispose() => _controller.close();
}

void main() {
  group('Leads Data Synchronization Tests', () {
    late FakeLeadsRepository repository;
    late LeadsBloc bloc;

    setUp(() {
      repository = FakeLeadsRepository();
      bloc = LeadsBloc(leadsRepository: repository);
    });
    tearDown(() => bloc.close());

    test('LeadsBloc removes lead automatically on repository deletion', () async {
      final lead = Lead(
        id: '123', name: 'John Doe', status: LeadStatus.newStatus,
        source: LeadPurpose.enquiry, category: LeadCategory.hot,
        phone: '9876543210', location: 'Kochi',
      );
      await repository.addLead(lead);

      bloc.add(const FetchLeads());
      await expectLater(bloc.stream, emitsInOrder([isA<LeadsLoading>(), isA<LeadsLoaded>()]));

      final stateBefore = bloc.state as LeadsLoaded;
      expect(stateBefore.filteredLeads.length, 1);
      expect(stateBefore.filteredLeads.first.id, '123');

      await repository.deleteLead('123');
      await expectLater(bloc.stream, emits(predicate<LeadsLoaded>((s) => s.filteredLeads.isEmpty)));
    });
  });
}

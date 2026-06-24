import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/bloc/deals/deals_bloc.dart';
import 'package:crm_agent_app/bloc/deals/deals_models.dart';
import 'package:crm_agent_app/bloc/leads/leads_models.dart';
import 'package:crm_agent_app/bloc/leads/leads_enums.dart';
import 'package:crm_agent_app/data/repositories/deals_repository.dart';
import 'package:crm_agent_app/screens/enquiry_details/widgets/add_deal_bottom_sheet.dart';

class FakeDealsRepository implements DealsRepository {
  final List<Deal> deals = [];
  @override
  Future<List<Deal>> getDeals() async => deals;
  @override
  Future<void> addDeal(Deal deal) async => deals.add(deal);
}

void main() {
  testWidgets('Add Deal Bottom Sheet validation and submission test', (
    tester,
  ) async {
    final repo = FakeDealsRepository();
    final bloc = DealsBloc(dealsRepository: repo)..add(const LoadDeals());
    const lead = Lead(
      id: '1',
      name: 'Rahul Menon',
      status: LeadStatus.interested,
      source: LeadPurpose.newAdmission,
      category: LeadCategory.hot,
      phone: '9876543210',
      location: 'Kochi',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<DealsBloc>.value(
            value: bloc,
            child: AddDealBottomSheet(lead: lead),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('New Deal'), findsOneWidget);
    expect(find.text('Rahul Menon'), findsOneWidget);
    expect(find.text('New Admission · 9876543210'), findsOneWidget);

    final nameField = find.byType(TextFormField).first;
    final amountField = find.byType(TextFormField).last;
    final submitButton = find.byType(ElevatedButton);

    // Initial state
    expect(
      tester.widget<TextFormField>(nameField).controller?.text,
      'New Admission — Rahul',
    );
    expect(tester.widget<ElevatedButton>(submitButton).enabled, isFalse);

    // Enter valid amount
    await tester.enterText(amountField, '85000');
    await tester.pumpAndSettle();
    expect(tester.widget<ElevatedButton>(submitButton).enabled, isTrue);

    // Submit
    await tester.tap(submitButton);
    await tester.pumpAndSettle();

    expect(repo.deals, hasLength(1));
    expect(repo.deals.first.title, 'New Admission — Rahul');
    expect(repo.deals.first.amount, 85000);
    expect(repo.deals.first.clientName, 'Rahul Menon');
    expect(repo.deals.first.stage, DealStage.newStage);
  });
}

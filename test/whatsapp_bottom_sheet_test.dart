import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/screens/enquiry_details/widgets/whatsapp_bottom_sheet.dart';
import 'package:crm_agent_app/screens/enquiry_details/widgets/whatsapp_template_card.dart';
import 'package:crm_agent_app/screens/enquiry_details/widgets/whatsapp_send_button.dart';
import 'package:crm_agent_app/utils/whatsapp_service.dart';
import 'package:crm_agent_app/bloc/leads/leads_models.dart';
import 'package:crm_agent_app/bloc/leads/leads_enums.dart';

class FakeWhatsAppService extends WhatsAppService {
  String? phone;
  String? message;

  @override
  Future<bool> launchWhatsApp({
    required String phone,
    required String message,
  }) async {
    this.phone = phone;
    this.message = message;
    return true;
  }
}

void main() {
  testWidgets('WhatsApp bottom sheet opening and interaction test', (
    WidgetTester tester,
  ) async {
    final fakeService = FakeWhatsAppService();
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
          body: WhatsAppBottomSheet(lead: lead, whatsappService: fakeService),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(WhatsAppBottomSheet), findsOneWidget);
    expect(find.text('Send a message'), findsOneWidget);

    final textFieldFinder = find.byType(TextField);
    final sendBtnFinder = find.byType(WhatsAppSendButton);
    final elevatedButton = find.descendant(
      of: sendBtnFinder,
      matching: find.byType(ElevatedButton),
    );

    // 1. Select Template
    await tester.tap(find.byType(WhatsAppTemplateCard).first);
    await tester.pumpAndSettle();
    expect(
      tester.widget<TextField>(textFieldFinder).controller?.text,
      contains('Rahul Menon'),
    );
    expect(tester.widget<ElevatedButton>(elevatedButton).enabled, isTrue);

    // 2. Tap Write Your Own -> Should clear the template text
    await tester.tap(find.text('Write your own'));
    await tester.pumpAndSettle();
    expect(
      tester.widget<TextField>(textFieldFinder).controller?.text.isEmpty,
      isTrue,
    );
    expect(tester.widget<ElevatedButton>(elevatedButton).enabled, isFalse);

    // 3. Custom message and launch
    await tester.enterText(textFieldFinder, 'Custom message text');
    await tester.pumpAndSettle();
    expect(tester.widget<ElevatedButton>(elevatedButton).enabled, isTrue);

    await tester.tap(elevatedButton);
    await tester.pumpAndSettle();

    expect(fakeService.phone, '9876543210');
    expect(fakeService.message, 'Custom message text');
  });
}

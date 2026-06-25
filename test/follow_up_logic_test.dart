import 'package:flutter_test/flutter_test.dart';
import 'package:crm_agent_app/data/models/follow_up_models.dart';
import 'package:crm_agent_app/data/models/lead_enums.dart';

void main() {
  group('FollowUp Urgency Categorization Tests', () {
    test('Overdue logic: scheduled time in the past and on a prior day', () {
      final pastDate = DateTime.now().subtract(const Duration(days: 1));
      final followUp = FollowUp(
        id: 'test-1',
        name: 'John Doe',
        category: LeadPurpose.enquiry,
        status: LeadStatus.followUp,
        scheduledTime: pastDate,
      );

      expect(followUp.urgency, FollowUpUrgency.overdue);
    });

    test('Due Today logic: scheduled time today (regardless of hour)', () {
      // 2 hours in the past, but still today
      final pastToday = DateTime.now().subtract(const Duration(hours: 2));
      final followUpPast = FollowUp(
        id: 'test-2a',
        name: 'Jane Doe',
        category: LeadPurpose.enquiry,
        status: LeadStatus.followUp,
        scheduledTime: pastToday,
      );

      // 2 hours in the future, today
      final futureToday = DateTime.now().add(const Duration(hours: 2));
      final followUpFuture = FollowUp(
        id: 'test-2b',
        name: 'Jane Doe',
        category: LeadPurpose.enquiry,
        status: LeadStatus.followUp,
        scheduledTime: futureToday,
      );

      // Verify both are categorized as dueToday
      expect(followUpPast.urgency, FollowUpUrgency.dueToday);
      expect(followUpFuture.urgency, FollowUpUrgency.dueToday);
    });

    test('Upcoming logic: scheduled time in the future on a future day', () {
      final futureDate = DateTime.now().add(const Duration(days: 2));
      final followUp = FollowUp(
        id: 'test-3',
        name: 'Bob Smith',
        category: LeadPurpose.enquiry,
        status: LeadStatus.followUp,
        scheduledTime: futureDate,
      );

      expect(followUp.urgency, FollowUpUrgency.upcoming);
    });
  });
}

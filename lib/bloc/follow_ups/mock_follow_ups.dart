import '../leads/leads_enums.dart';
import 'follow_ups_models.dart';

/// Static list of mock follow-up call data.
final mockFollowUps = [
  FollowUp(
    id: '7',
    name: 'Vishnu Prasad',
    category: LeadPurpose.enquiry,
    status: LeadStatus.followUp,
    scheduledTime: DateTime.now().subtract(const Duration(days: 1)),
  ),
  FollowUp(
    id: '1',
    name: 'Rahul Menon',
    category: LeadPurpose.newAdmission,
    status: LeadStatus.interested,
    scheduledTime: DateTime.now().add(const Duration(minutes: 10)),
  ),
  FollowUp(
    id: '2',
    name: 'Sneha Pillai',
    category: LeadPurpose.enquiry,
    status: LeadStatus.followUp,
    scheduledTime: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  FollowUp(
    id: '3',
    name: 'Aravind Krishnan',
    category: LeadPurpose.newAdmission,
    status: LeadStatus.qualified,
    scheduledTime: DateTime.now().add(const Duration(hours: 1)),
  ),
  FollowUp(
    id: '6',
    name: 'Anjali Suresh',
    category: LeadPurpose.newAdmission,
    status: LeadStatus.interested,
    scheduledTime: DateTime.now().add(const Duration(hours: 2)),
  ),
  FollowUp(
    id: '11',
    name: 'Lakshmi Warrier',
    category: LeadPurpose.enquiry,
    status: LeadStatus.interested,
    scheduledTime: DateTime.now().add(const Duration(hours: 3)),
  ),
  FollowUp(
    id: '4',
    name: 'Divya Raveendran',
    category: LeadPurpose.demoRequest,
    status: LeadStatus.newStatus,
    scheduledTime: DateTime.now().add(const Duration(days: 1)),
  ),
  FollowUp(
    id: '12',
    name: 'Fathima Zohra',
    category: LeadPurpose.demoRequest,
    status: LeadStatus.followUp,
    scheduledTime: DateTime.now().add(const Duration(days: 2)),
  ),
  FollowUp(
    id: '13',
    name: 'Karthik Nambiar',
    category: LeadPurpose.newAdmission,
    status: LeadStatus.newStatus,
    scheduledTime: DateTime.now().add(const Duration(days: 3)),
  ),
];

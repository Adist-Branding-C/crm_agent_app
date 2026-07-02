import '../models/notification_models.dart';

const List<NotificationItem> mockNotificationsList = [
  NotificationItem(id: '1', title: 'New lead assigned', subtitle: 'Divya Raveendran • Instagram enquiry', time: '5 min ago', type: NotificationType.lead, isRead: false, routePath: '/enquiry-details/4'),
  NotificationItem(id: '2', title: 'Follow-up call due', subtitle: 'Call back Lakshmi Warrier — batch slot closing', time: '20 min ago', type: NotificationType.followUp, isRead: false, routePath: '/follow-up-calls'),
  NotificationItem(id: '3', title: 'Task overdue', subtitle: 'Demo reminder — Divya Raveendran', time: '1 hr ago', type: NotificationType.task, isRead: false, routePath: '/dashboard?tab=tasks&filter=overdue'),
  NotificationItem(id: '4', title: 'Deal moved to Negotiation', subtitle: 'Corporate Batch — Fathima Z. • ₹3.4L', time: '3 hr ago', type: NotificationType.deal, isRead: true, routePath: '/deals'),
  NotificationItem(id: '5', title: 'Lead status updated', subtitle: 'Anjali Suresh → Interested', time: '5 hr ago', type: NotificationType.leadStatus, isRead: true, routePath: '/enquiry-details/6'),
  NotificationItem(id: '6', title: 'Mention in note', subtitle: '@you Admin tagged you on Sneha Pillai', time: 'Yesterday', type: NotificationType.mention, isRead: true, routePath: '/enquiry-details/2'),
];

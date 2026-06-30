import 'privacy_policy_model.dart';

/// Part 1 of the structured Privacy Policy sections.
final List<PrivacyPolicySection> privacySectionsPart1 = [
  const PrivacyPolicySection(
    title: '1. Introduction',
    bulletPoints: [
      'Effective Date: June 30, 2026',
      'This Privacy Policy describes how the CRM Agent application collects, '
          'uses, and shares your personal information. It applies to all users '
          'of our mobile application.',
      'We are committed to protecting your privacy and securing your business '
          'and client data in accordance with applicable laws.',
    ],
  ),
  const PrivacyPolicySection(
    title: '2. Information We Collect',
    bulletPoints: [
      'Agent Account Information: We collect your name, email, phone number, '
          'and login credentials to manage your account and authenticate access.',
      'Lead and Customer Data: To provide CRM services, we store names, '
          'emails, telephone numbers, and interaction details of leads '
          'imported or manually created by you.',
      'Attendance and Activity Logs: We track your check-in/check-out '
          'timestamps, call activity metrics (e.g., call durations and outcomes) '
          'to generate reports for your CRM organization.',
    ],
  ),
  const PrivacyPolicySection(
    title: '3. Device Permissions Required',
    bulletPoints: [
      'Phone and Call Logs: The application requests access to initiate calls '
          'to leads directly and record call metadata (duration, outcome) in the '
          'CRM. Call recordings are not made without your explicit permission.',
      'Notifications: We request permission to send push notifications for '
          'important follow-ups, assigned tasks, and campaigns.',
    ],
  ),
];
